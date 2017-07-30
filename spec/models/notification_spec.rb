require './app/models/notification'

describe Notification do  
  subject(:notification) { described_class }
  let(:tagged_user) { double(:user) }
  let(:tagging_user) { double(:user) }

  describe ".send" do
    before do
      allow(tagged_user).to receive(:email) { "mouse@dmhideout.com" }
      allow(tagging_user).to receive(:username) { "penfold" }
    end

    it "composes an email to a user who has been tagged" do
      expect(notification.send(tagged_user, tagging_user)).to have_sent_email.to("mouse@dmhideout.com")
    end

    it "tells the user who has tagged them" do
      expect(notification.send(tagged_user, tagging_user)).to have_sent_email.with_body("penfold peeped about you")
    end
  end
end
