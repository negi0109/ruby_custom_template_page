require "custom_template_page/version"
require "rexml/document"

module CustomTemplatePage
  class Error < StandardError; end
  # Your code goes here...
  def self.convert(source, datas)
    root = "<root>#{source}</root>"
    page = REXML::Document.new(root)
    children = page.root.children[0]
    tmp = children.to_s
    datas.each do |k, v|
      tmp = tmp.to_s.gsub("@#{k}", v.to_s)
    end

    tmp
  end
end
