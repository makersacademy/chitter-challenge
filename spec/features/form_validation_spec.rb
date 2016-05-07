require 'spec_helper'

feature 'Validating the form when creating a new user' do
	scenario 'user cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "user cannot sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'user cannot sign up with an existing email' do
	  sign_up
	  expect { sign_up }.to_not change(User, :count)
	  expect(page).to have_content('Email is already taken')
	end

	scenario 'user cannot sign up with a password that does not match' do
	  expect { sign_up(password_confirmation: '123456') }.not_to change(User, :count)
	  expect(current_path).to eq('/users')
	  expect(page).to have_content 'Password does not match the confirmation'
	end
end