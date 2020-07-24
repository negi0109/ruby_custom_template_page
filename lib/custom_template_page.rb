require "custom_template_page/version"
require "rexml/document"

module CustomTemplatePage
  class Error < StandardError; end
  # Your code goes here...
  def self.convert(source, datas)
    root = "<root>#{source}</root>"
    page = REXML::Document.new(root)

    out_text = ''
    page.root.children.each do |child|
      tmp = child.to_s
      datas.each do |k, v|
        tmp = tmp.gsub("@#{k}", v.to_s)
      end

      out_text += tmp
    end

    out_text
  end
end
