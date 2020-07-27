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

    context "tag" do
      let(:data) {{ a: 12, b: 23 }}

      context "1 tag" do
        let(:source) {"<p>@a @b</p>"}

        it { is_expected.to eq "<p>12 23</p>"}
      end

      context "2 tag" do
        let(:source) { <<~HTML
          <p>@a</p>
          <p>@b</p>
          HTML
        }

        it { is_expected.to eq <<~HTML
          <p>12</p>
          <p>23</p>
          HTML
        }
      end
      context "nest tag" do
        let(:source) { <<~HTML
          <div>
            @a
            <p>@b</p>
          </div>
          HTML
        }

        it { is_expected.to eq <<~HTML
          <div>
            12
            <p>23</p>
          </div>
          HTML
        }
      end
    end
  end
end
