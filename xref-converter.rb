#class PDFConverter < (Asciidoctor::Converter.for 'pdf')
#  register_for 'pdf'
#  def convert_inline_anchor node
#  if node.type == :xref
#      caret = (load_theme node.document).menu_caret_content || %( \u203a )
#      %(<strong>[#{node.attr 'refid'} Guide #{caret}#{node.text}]</strong>)
#      #node.attr 'refid'.upcase
#    else
#      super
#    end
#  end
#end
# #{title}
#
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
      %(<strong> #{path} #{caret} </strong>)
    else
      super
    end
  end
end

