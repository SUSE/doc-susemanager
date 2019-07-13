'use strict'

const lunr = require('lunr')
const cheerio = require('cheerio')
const pako = require('pako')
const Entities = require('html-entities').AllHtmlEntities
const entities = new Entities()

/**
 * Generate a Lunr index.
 *
 * Iterates over the specified pages and creates a Lunr index.
 *
 * Note: Most of this code is from antora-lunr, but there are notable
 * differences:
 *
 * - site.url does not need to be defined
 * - a map of component name -> title is generated, so make faceted
 *   search results look nicer.
 *
 * @memberof indexer
 *
 * @param {Array<File>} pages - The publishable pages to map.
 * @param {ContentCatalog} [contentCatalog=undefined] - The catalog of all virtual content files in the site.
 * @returns {Object} A JSON object with a Lunr index, documents store, and component to component title map.
 */
function index (pages, contentCatalog) {
  if (!pages.length) return {}
  // Map of Lunr ref to document
  const documentsStore = {}
  // Map of component names to titles
  const components = {}

  console.log('Indexing...')
  const documents = pages.map((page) => {
    const html = page.contents.toString()
    const $ = cheerio.load(html)

    // fetch just the article content, so we don't index the TOC and
    // other on-page text
    // Remove any found headings, to improve search results
    const article = $('article.doc')
    const $h1 = $('h1', article)
    const documentTitle = $h1.text()
    $h1.remove()
    const titles = []
    $('h2,h3,h4,h5,h6', article).each(function () {
      let $title = $(this)
      titles.push({
        text: $title.text(),
        id: $title.attr('id'),
      })
      $title.remove()
    })

    // Pull the text from the article, and convert entities
    let text = article.text()
    // Decode HTML
    text = entities.decode(text)
    // Strip HTML tags
    text = text.replace(/(<([^>]+)>)/ig, '')
      .replace(/\n/g, ' ')
      .replace(/\r/g, ' ')
      .replace(/\s+/g, ' ')
      .trim()

    // add the page's component title to the component map
    if (!components.hasOwnProperty(page.src.component)) {
      var component = contentCatalog.getComponent(page.src.component)
      components[page.src.component] = component.title
    }

    // return the indexable content, organized by type
    return {
      text: text,
      title: documentTitle,
      component: page.src.component,
      version: page.src.version,
      name: page.src.stem,
      url: page.pub.url,
      titles: titles, // TODO get title id to be able to use fragment identifier
    }
  })

  // construct the lunr index from the composed content
  const lunrIndex = lunr(function () {
    const self = this
    self.ref('url')
    self.field('title', {boost: 10})
    self.field('name')
    self.field('text')
    self.field('component')
    self.metadataWhitelist = ['position']
    documents.forEach(function (doc) {
      self.add(doc)
      doc.titles.forEach(function (title) {
        self.add({
          title: title.text,
          url: `${doc.url}#${title.id}`,
        })
      }, self)
    }, self)
  })

  // place all indexed documents into the store
  documents.forEach(function (doc) {
    documentsStore[doc.url] = doc
  })

  // return the completed index, store, and component map
  return {
    index: lunrIndex,
    store: documentsStore,
    components: components,
  }
}

// helper function that converts a string into a buffer
function str2buffer (str) {
  var length = str.length
  var a16 = new Uint16Array(length)
  for (var i = 0; i < length; ++i) {
    a16[i] = str.charCodeAt(i)
  }
  return new Uint8Array(a16.buffer)
}

// take the index and compress it
function compress (index) {
  return pako.deflate(str2buffer(JSON.stringify(index)))
}

// helper function allowing Antora to create a site asset containing the
// index
function createIndexFile (index) {
  return {
    mediaType: 'application/gzip',
    contents: Buffer.from(compress(index)),
    src: {stem: 'search_index'},
    out: {path: 'search_index.json.gz'},
    pub: {url: '/search_index.json.gz', rootPath: ''},
  }
}

module.exports = index
module.exports.createIndexFile = createIndexFile
