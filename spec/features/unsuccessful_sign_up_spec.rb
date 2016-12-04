require 'spec_helper'

RSpec.feature 'unsuccessful account sign up', :type => :feature do

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

	scenario 'user cannot sign up with an already registered email' do
		sign_up
		expect { sign_up }.not_to change(User, :count)
		expect(page).to have_content('Email is already taken')
	end

end