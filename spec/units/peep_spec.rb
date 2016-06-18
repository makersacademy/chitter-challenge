describe Peep do
  subject { described_class }

  let!(:user) { create_user }

  let(:text_input) do
    "@one lorem @two ipsum http://test.com #one#two"
  end

  let(:html_output) do
    "<a href=\"http://twitter.com/one\" target=\"_blank\">@one</a> lorem "\
    "<a href=\"http://twitter.com/two\" target=\"_blank\">@two</a> ipsum "\
    "<a href=\"http://test.com\" target=\"_blank\">http://test.com</a> "\
    "<a href=\"http://twitter.com/hashtag/one\" target=\"_blank\">#one</a> "\
    "<a href=\"http://twitter.com/hashtag/two\" target=\"_blank\">#two</a>"
  end

  describe "#linkify" do
    it "should turn urls and words after @ or # into links" do
      expect(subject.linkify(text_input)).to eq(html_output)
    end
  end
end
