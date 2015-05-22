require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User browses all messages" do

  before(:each) do
    create_user
    sign_in
    post_message('first message')
    post_message('second message')
    post_message('third message')
  end

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("third message")
  end

  scenario "and can see the time" do
    visit '/'
    expect(page).to have_content("20")
  end

end