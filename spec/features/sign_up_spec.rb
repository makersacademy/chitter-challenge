require 'spec_helper'

RSpec.feature 'account sign up', :type => :feature do
	
	scenario 'a new user can sign up for an account' do
		sign_up
		expect(page).to have_current_path('/')
		expect(page).to have_content('Welcome, John!')
	end

	scenario 'user count increases when user signs up' do
		expect { sign_up }.to change(User, :count).by(1)
	end

	scenario 'user count does not increase when password confirmation is incorrect' do
		expect { invalid_sign_up }.to change(User, :count).by(0)
	end

	scenario 'user receives error when password confirmation is incorrect' do
		invalid_sign_up
		expect(page).to have_current_path('/users/add')
		expect(page).to have_content('Password and confirmation password do not match')
	end

end