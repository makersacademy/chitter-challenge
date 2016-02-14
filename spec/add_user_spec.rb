require 'web_helper'

feature 'User can sign up' do
  scenario 'Sign up a new user' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, SteveSmith")
    expect(User.first.email).to eq('steve@stevesmail.com')
  end

  scenario 'requires a matching confirmation password' do
   expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
   expect(current_path).to eq('/sign_up') # current_path is a helper provided by Capybara
   expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end
  
end
