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