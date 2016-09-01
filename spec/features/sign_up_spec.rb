require 'spec_helper'

feature 'Sign Up' do
  scenario 'a user go to the sign up page' do
    visit '/'
    click_link 'Sign Up Here'
    expect(page.status_code).to eq(200)
  end

  scenario 'a user can sign up to Chitter' do
    sign_up
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome Joe Sweeny'
    expect(User.first.email).to eq 'joesweeny84@hotmail.com'
  end
end
