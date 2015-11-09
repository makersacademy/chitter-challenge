require 'spec_helper'
require 'tilt/erb'

feature 'Signing in' do

	scenario 'with the correct credentials' do
		sign_in
		expect(page).to have_content('Welcome, d9nny')
	end

	scenario 'with the wrong password' do
		sign_in(password: "wrong password")
		expect(current_path).to eq('/homepage')
		expect(page).to have_content('The email or password is incorrect')
	end

	scenario 'with the wrong username' do
		sign_in(username: "dan")
		expect(current_path).to eq('/homepage')
		expect(page).to have_content('The email or password is incorrect')
	end
end