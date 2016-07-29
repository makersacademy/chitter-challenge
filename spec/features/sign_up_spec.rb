require 'spec_helper'

feature 'Sign Up' do
  scenario 'a user go to the sign up page' do
    visit '/'
    click_link 'Sign Up'
    expect(page.status_code).to eq(200)
  end

  scenario 'a user can sign up to Chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome Joe Sweeny'
    expect(User.first.email).to eq 'joesweeny84@hotmail.com'
  end
end


# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
