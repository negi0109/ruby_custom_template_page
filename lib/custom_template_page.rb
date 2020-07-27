require "custom_template_page/version"
require "rexml/document"

module CustomTemplatePage
  class Error < StandardError; end
  # Your code goes here...
  def self.convert(source, datas)
    root = "<root>#{source}</root>"
    page = REXML::Document.new(root)

    convert_dfs!(page.root, datas)

    out_text = ''
    page.root.children.each{ |child| out_text += child.to_s }

    out_text
  end

  def self.convert_dfs!(node, datas)
    case node.node_type
    when :text then
      tmp = node.value
      datas.each do |k, v|
        tmp = tmp.gsub("@#{k}", v.to_s)
      end
      node.value = tmp
    when :element then
      if node.parent?
        node.each_child do |child|
          convert_dfs!(child, datas)
        end
      end
    end
  end
end
