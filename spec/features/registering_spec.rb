require 'spec_helper'
require 'tilt/erb'

feature 'Registering,' do
	scenario 'User can sign up as a new user' do
		expect{sign_up}.to change(User, :count).by(1)
		expect(page).to have_content('Welcome, d9nny')
		expect(User.first.email).to eq('dan@google.com')
	end	

	scenario 'User cannot sign up with a username which has already been taken' do
		sign_up
		expect{sign_up(email: 'dan@yahoo.com')}.not_to change(User, :count)
		expect(page).to have_content 'Username is already taken'
	end
 
	scenario 'User sign up with non matching passwords' do
		expect{sign_up(password_confirmation: 'wrong password')}.not_to change(User, :count)
		expect(current_path).to eq('/users')
		expect(page).to have_content 'Password does not match the confirmation'
	end

	scenario 'User cannot sign up with a blank email address' do
		expect{sign_up(email: nil)}.not_to change(User, :count)
		expect(page).to have_content 'Email must not be blank'
	end

	scenario 'User cannot sign up with an invalid email address' do
		expect{sign_up(email: 'dan@google')}.not_to change(User, :count)
		expect(page).to have_content 'Email has an invalid format'
	end

	scenario 'User cannot sign up with an already registered email' do
		sign_up
		expect{sign_up(username: 'd9n')}.not_to change(User, :count)
		expect(page).to have_content 'Email is already taken'
	end
end