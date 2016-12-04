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
		expect { sign_up(password_confirmation: 'wrongpassword') }.not_to change(User, :count)
	end

	scenario 'user receives error when password confirmation is incorrect' do
		sign_up(password_confirmation: 'wrongpassword')
		expect(page).to have_current_path('/users/add')
		expect(page).to have_content('Password and confirmation password do not match')
	end

	scenario 'user cannot sign up without entering a firstname' do
		expect { sign_up(firstname: nil) }.not_to change(User, :count)
	end

	scenario 'user cannot sign up without entering a surname' do
		expect { sign_up(surname: nil) }.not_to change(User, :count)
	end

	scenario 'user cannot sign up without entering an email' do
		expect { sign_up(email: nil) }.not_to change(User, :count)
	end

	scenario 'user cannot sign up without entering a username' do
		expect { sign_up(username: nil) }.not_to change(User, :count)
	end

	scenario 'user cannot sign up with an invalid email address' do
		expect { sign_up(email: 'not-an-email') }.not_to change(User, :count)
	end

end