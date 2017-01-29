require 'spec_helper'

feature 'Log in' do

	scenario 'user can log in with correct credentials' do
	User.create(username: "bobtheman",email: "bob@example.com",password: "123", password_confirmation: "123", name: "Bob Sing")
	visit('/')
	click_on('Log In')
	fill_in('email', with: "bob@example.com")
	fill_in('password', with: "123")
	click_button('Log In')
	expect(page).to have_content("Welcome, bobtheman")
	end

	scenario 'user cannot log in with incorrect credentials' do
	User.create(username: "bobtheman",email: "bob@example",password: "123", password_confirmation: "123", name: "Bob Sing")
	visit('/log_in')
	fill_in('email', with:"bob@example.com")
	fill_in('password', with:"12")
	click_button('Log In')
	expect(page).to have_content("Incorrect credentials")
	end

end