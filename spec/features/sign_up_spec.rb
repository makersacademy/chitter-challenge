require 'spec_helper'

feature 'Sign up' do
	scenario 'user cannot sign up and appear in database with incorrect email format' do
	visit('/sign_up')
	fill_in('email', with: "bob")
	fill_in('password', with:"123")
	fill_in('password_confirmation', with:"123")
	fill_in('username', with: "bob")
	fill_in('name', with: "Bobby")
	click_button('Sign Up')
	expect(User.all(username: "bob")).to be_empty
	end

	scenario 'user can sign up and appear in database' do
	visit('/sign_up')
	fill_in('email', with:"bob@example.com")
	fill_in('password', with:"123")
	fill_in('password_confirmation', with:"123")
	fill_in('username', with: "bobtheman")
	fill_in('name', with: "Bobby Sing")
	click_button('Sign Up')
	expect(User.first.email).to eq("bob@example.com")
	end


end