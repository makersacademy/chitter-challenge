require 'spec_helper'

RSpec.feature 'signing in', :type => :feature do

	let!(:user) do
		User.create(firstname: 'John',
			surname: 'Doe',
			email: 'john@doe.com',
			username: 'JayDawg',
			password: 'password123',
			password_confirmation: 'password123')
	end

	scenario 'user can sign in with correct credentials' do
		sign_in(email: user.email, password: user.password)
		expect(page.status_code).to eq(200)
		expect(page).to have_content("Welcome, John!")
	end

	scenario 'user cannot sign in with incorrect email' do
		sign_in(email: 'wrong@email.com', password: user.password)
		expect(page).to have_content("Email address or password is incorrect")
	end

	scenario 'user cannot sign in with incorrect password' do
		sign_in(email: user.email, password: 'wrongpassword')
		expect(page).to have_content("Email address or password is incorrect")
	end

end