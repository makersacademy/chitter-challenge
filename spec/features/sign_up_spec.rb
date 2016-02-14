require 'helper.rb'
require_relative '../../app/models/user'

feature 'User capabilities, ' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'dadadsd') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'requires an email to be entered' do
    expect { sign_up(email: '') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'can\'t sign up with already registered email' do
    sign_up
    expect { sign_up(email: "scott@example.com") }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
