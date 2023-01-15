require "spec_helper"
require_relative "../app/helpers/session_helper"
include SessionHelper

describe SessionHelper do

  context "logged_in? method" do
    it 'returns true when user is logged in' do
      allow(subject).to receive(:session).and_return({ user_id: 1 })
      expect(subject.logged_in?).to be true
    end

    it 'returns false when user is not logged in' do
      allow(subject).to receive(:session).and_return({})
      expect(subject.logged_in?).to be false
    end
  end

  context 'current_user' do
    it 'returns the current user when user is logged in' do
      user = User.create(id: "1",username: "test")
      allow(subject).to receive(:session).and_return({ user_id: user.id })
      expect(subject.current_user).to eq(user)
    end

    it 'returns nil when user is not logged in' do
      allow(subject).to receive(:session).and_return({})
      expect(subject.current_user).to be_nil
    end
  end

  context 'send_tag_email method' do
    include Mail::Matchers

    before(:each) do
      Mail::TestMailer.deliveries.clear
    end

    it 'sends an email' do
      send_tag_email("test", "test@email.com", "test content") { is_expected.to have_sent_email }
    end

    it 'sends an email with the correct recipient' do
      send_tag_email("Test", "mike1@me.com", "Test Content") { is_expected.to have_sent_email.to('mike1@me.com') }
    end

    it 'sends an email with the correct subject' do
      send_tag_email("Test", "mike1@me.com", "Test Content") { is_expected.to have_sent_email.with_subject('You have been tagged in an post!') }
    end

    it 'sends an email with the correct subject' do
      send_tag_email("Test", "mike1@me.com", "Test Content") { is_expected.to have_sent_email.with_body('Test Content') }
    end
  end
end
