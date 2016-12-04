require 'spec_helper'

RSpec.feature 'invalid password confirmation at sign up', :type => :feature do

	scenario 'user count does not increase when password confirmation is incorrect' do
		expect { sign_up(password_confirmation: 'wrongpassword') }.not_to change(User, :count)
	end

	scenario 'user receives error when password confirmation is incorrect' do
		sign_up(password_confirmation: 'wrongpassword')
		expect(page).to have_current_path('/users/add')
		expect(page).to have_content('Password does not match the confirmation')
	end

end