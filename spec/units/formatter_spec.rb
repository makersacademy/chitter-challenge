describe Formatter do
  subject { described_class }

  let(:text_input) do
    "@one lorem @two ipsum http://test.com #one#two"
  end

  let(:html_output) do
    "<a href=\"/user/profile/one\">@one</a> lorem "\
    "<a href=\"/user/profile/two\">@two</a> ipsum "\
    "<a href=\"http://test.com\" target=\"_blank\">http://test.com</a> "\
    "<a href=\"/hashtag/one\">#one</a> "\
    "<a href=\"/hashtag/two\">#two</a>"
  end

  describe "#html" do
    it "should turn urls and words after @ or # into links" do
      expect(subject.html(text_input)).to eq(html_output)
    end
  end
end
