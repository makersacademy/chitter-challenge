require 'capybara/rspec'
require 'spec_helper'
require 'web_helper'

feature "Sign Up" do

  scenario "When I go on Chitter I can sign up with my email and provide a password, name and user name" do
    expect { sign_up }.to change(User, :count).by(1)
    # expect(current_path).to eq('/home')
    expect(page).to have_content("Welcome, 92jackhenderson@gmail.com")
    expect(User.last.email).to eq('92jackhenderson@gmail.com')
  end

  scenario 'requires a matching password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Passwords do not match!'
  end
  #
  # scenario "so that I can't sign up with an existing email" do
  #   sign_up
  #   expect {sign_up }.to_not change(User, :count)
  #   expect(page).to have_content("Email is already in use")
  # end

 #  scenario 'I cannot sign up without an email address' do
 #   expect { sign_up(email: nil) }.not_to change(User, :count)
 #   expect(current_path).to eq('/users')
 #   expect(page).to have_content('Email must not be blank')
 # end
 #
 # scenario 'I cannot sign up with an invalid email address' do
 #   expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
 #   expect(current_path).to eq('/users')
 #   expect(page).to have_content('Email has an invalid format')
 # end

end
