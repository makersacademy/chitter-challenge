require 'spec_helper'

feature 'Signing Out' do
	scenario 'while being signed in' do
		sign_up
		click_button('Sign out')
		expect(page).not_to have_content('Welcome, d9nny')
	end
end