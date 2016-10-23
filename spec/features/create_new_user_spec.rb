require 'spec_helper'

feature 'Creating new users' do
	scenario 'Creating a new user' do
		expect { create_user }.to change(User, :count).by 1
	end

	scenario 'user provides mismatching passwords' do
		create_user(password_confirmation: 'wrong')
  	expect(current_path).to eq('/create_user')
  	expect(page).to have_content 'Password does not match the confirmation'
	end

	scenario "I can't sign up without an email address" do
    expect { create_user(email: nil) }.not_to change(User, :count)
  end

	scenario "I can't sign up with an invalid email address" do
    expect { create_user(email: "invalid@email") }.not_to change(User, :count)
  end

	scenario 'I cannot sign up with an existing email' do
	  create_user
	  expect { create_user }.to_not change(User, :count)
	  expect(page).to have_content('Email is already taken')
	end

  scenario 'I cannot sign up with an existing username' do
	  create_user
	  expect { create_user }.to_not change(User, :count)
	  expect(page).to have_content('Email is already taken')
	end
end
