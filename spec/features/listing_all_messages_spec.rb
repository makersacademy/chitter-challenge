require './spec/spec_helper'

feature 'listing all messages' do
  before(:each) {
    Message.create(:memo => "Hey, we're live!")
    Message.create(:memo => "Testing, testing")
    Message.create(:memo => "Let's try this")
    }
end
