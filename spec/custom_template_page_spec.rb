RSpec.describe CustomTemplatePage do
  it "has a version number" do
    expect(CustomTemplatePage::VERSION).not_to be nil
  end

  describe "convert" do
    it "string data" do
      source = "@a @b"
      data = { a: "abc", b: "def" }

      out = CustomTemplatePage.convert(source, data)
      expect(out).to eq "abc def"
    end

    it "numver data" do
      source = "@a @b"
      data = { a: 12, b: 23 }

      out = CustomTemplatePage.convert(source, data)
      expect(out).to eq "12 23"
    end
  end
end
