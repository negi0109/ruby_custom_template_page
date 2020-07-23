require "custom_template_page/version"

module CustomTemplatePage
  class Error < StandardError; end
  # Your code goes here...
  def self.convert(source, datas)
    tmp = source
    datas.each do |k, v|
      p [k, v]
      tmp = tmp.gsub("@" + k.to_s, v.to_s)
    end

    tmp
  end
end
