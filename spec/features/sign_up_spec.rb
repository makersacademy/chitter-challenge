require 'web_helper'

feature 'sign up' do

  before do
    sign_up
  end

  scenario 'a new user signs up' do
    expect(page).to have_content 'Welcome back to chitter, Oli'
  end

  scenario 'new user is allowed to post' do
    peep('new user first message')
    expect(page).to have_content 'new user first message'
    expect(page).to have_content 'Posted by: Oli'
  end

end
