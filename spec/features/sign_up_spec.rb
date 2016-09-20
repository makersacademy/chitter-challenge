require 'spec_helper'

feature 'Sign Up' do
  scenario 'a user go to the sign up page' do
    visit '/'
    click_link 'Sign Up'
    expect(page.status_code).to eq(200)
  end

  scenario 'a user can sign up to Chitter' do
    sign_up
    expect(page).to have_content 'Welcome, @joesweeny'
    expect(User.first.email).to eq 'joesweeny84@hotmail.com'
    expect(User.count).to eq (1)
  end
end
