RSpec.describe CustomTemplatePage do
  it "has a version number" do
    expect(CustomTemplatePage::VERSION).not_to be nil
  end

  describe "convert" do
    let(:source) { "@a @b" }
    let(:data) {{}}
    subject { CustomTemplatePage.convert(source, data) }

    context "string data" do
      let(:data) {{ a: "abc", b: "def" }}
      it { is_expected.to eq "abc def" }
    end

    context "numver data" do
      let(:data) {{ a: 12, b: 23 }}
      it { is_expected.to eq "12 23" }
    end
  end
end
