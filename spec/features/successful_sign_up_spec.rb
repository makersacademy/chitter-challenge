require 'spec_helper'

RSpec.feature 'successful account sign up', :type => :feature do
	
	scenario 'a new user can sign up for an account' do
		sign_up
		expect(page).to have_current_path('/')
		expect(page).to have_content('Welcome, John!')
	end

	scenario 'user count increases when user signs up' do
		expect { sign_up }.to change(User, :count).by(1)
	end

end