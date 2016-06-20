# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
# sign up to chitter with their email, password, name and a user name
require_relative 'web_helpers'

feature 'User sign up' do
  scenario 'New users can sign up' do
    visit '/user/signup'
    expect(page.status_code).to eq(200)
    sign_up
    expect(page).to have_content 'Welcome Alex'
  end

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome Alex')
    expect(User.first.email).to eq('alex@email.com')
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up_no_email }.not_to change(User, :count)
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end
