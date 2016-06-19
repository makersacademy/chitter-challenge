require 'web_helper'



feature 'signing up' do
	scenario 'I can sign up' do
		sign_up
		expect(page).to have_content 'Welcome, Bob'
	end


  scenario 'new user signs up and user count increases by 1' do
    sign_up
    expect(User.count).to eq 1
  end

  scenario 'requires a matching confirmation password' do
   expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
   expect(current_path).to eq('/sign_up')
   expect(page).to have_content('Password does not match the confirmation')
  end

  # scenario 'I cannot sign up without an email address' do
  #  expect { sign_up(email: nil) }.not_to change(User, :count)
  #  expect(current_path).to eq('/users')
  #  expect(page).to have_content('Email must not be blank')
  # end
	#
  # scenario 'I cannot sign up without a valid email address' do
  #  expect { sign_up(email: '1234') }.not_to change(User, :count)
  #  expect(current_path).to eq('/users')
  #  expect(page).to have_content('Email has an invalid format')
  # end
	#
  # scenario 'I cannot sign up with an existing email address' do
  #   sign_up
  #  expect { sign_up }.not_to change(User, :count)
  #  expect(page).to have_content('Email is already taken')
  # end
end
