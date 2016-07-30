require 'spec_helper.rb'

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter and see a welcome messgae

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    visit 'users/new'
    expect(page.status_code).to eq 200

    fill_in :email, with: 'jck_catchall@outlook.com'
    fill_in :password, with: password_confirmation
    click_button 'Register'

    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome to Chitter")
  end
end
