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
        if node.name == 'each' then
          prev_node = node
          datas[node.attributes["value"].to_sym].each do |value|
            node.children.each do |child|
              tmp = child.parent? ? child.deep_clone : child.clone
              convert_dfs!(tmp, datas.merge({ value: value }))
              prev_node.next_sibling = tmp
              prev_node = tmp
            end
          end
          pp node.parent.children
          node.remove
        elsif node.name == 'alias' then
          key = node.attributes["as"].to_sym
          value = datas[node.attributes["value"].to_sym]

          prev_node = node
          node.children.each do |child|
            tmp_data = {}
            tmp_data[key] = value
            tmp = child.parent? ? child.deep_clone : child.clone
            convert_dfs!(tmp, datas.merge(tmp_data))
            prev_node.next_sibling = tmp
            prev_node = tmp
          end
          node.remove
        else
          node.each_child do |child|
            convert_dfs!(child, datas)
          end
        end
      end
    end
  end
end
