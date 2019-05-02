class PDFConverter < (Asciidoctor::Converter.for 'pdf')
  register_for 'pdf'
  puts 'Ooh! Look! A Converter'
  # asciidoctor-pdf -b pdf -r ./tanchor/inline_anchor.rb test.adoc
  def convert_inline_anchor node
    if node.type == :xref
      caret = (load_theme node.document).menu_caret_content || %( \u203a )
      title = node.text
      path =  node.attr('refid').split(':').map do |element|
        element.split("-").map {|word| word.capitalize}.join(" ")
      end
      path = path.join(caret)
      %(<strong>[ #{path} #{caret} ] </strong>)
    else
      super
    end
  end
end

#REMARKS: Dan Allen Comments
# FYI, node.attr 'refid' is what contains the page ID, minus the .adoc file extension
# you can see how I extract information from the xref in Antora here: https://gitlab.com/antora/antora/blob/master/packages/asciidoc-loader/lib/converter/html5.js
# If the path attribute is set, you know it's an interdocument xref (as opposed to an in-page anchor)
# You have to skip any xref that doesn't have the 'path' attribute set
# The presence of the 'path' attribute tells you that it's not an internal reference
#{title}
# TODO drop the caret at the end of a the path, if there is a subfolder we need to drop '/' and add a space.
#
# We style our xrefs in 3 ways:
#
# xref:reference:filename.adoc[Title]
#      module    filename      title
#
# xref:reference:systems/filename.adoc[Title]
#      module    subdir  filename      title
#
# xref:reference:/systems/filename.adoc#SECT-ID[Title]
#      module     subdir  filename     section id  title
#
# These should end up looking like one of the following in PDF:
#
# [ Reference > Systems > Filename,  Section: TITLE ]
#
# or:
#
# [ Reference > Systems > Filename ]
#
# We need to skip internal references <<cve-maintenance>> without the path attribute set Otherwise all of our internal refs are converted into a
# non clickable link. We need to skip and preserve these.