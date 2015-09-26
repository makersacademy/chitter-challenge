require 'spec_helper'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    # user = build :user
    # sign_up(user)
    #
    visit '/user'
    expect(page).to have_content("Test user!")
  end

end
