require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'Postings a message' do

  scenario 'when user is logged in' do
    create_user
    sign_in
    visit '/'
    expect(page).to have_button('Post Message')
    post_message("This is a test message")
    message = Message.first
    expect(message.text).to eq("This is a test message")
    expect(message.author).to eq("test@test.com")
  end

  scenario 'when usre is not logged in' do
    visit '/'
    expect(page).not_to have_button('Post Message')
  end

end
