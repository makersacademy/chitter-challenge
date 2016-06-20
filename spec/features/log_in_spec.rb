require 'spec_helper'

feature 'log in existing user' do

	let!(:user) do
		User.create(email: 'merve@test.com',
		password: '1234', username: 'User1')
	end

	def sign_in(email:, password:)
		visit '/'
		fill_in :email, with: email
		fill_in :password, with: password
		click_button('Sign in!')
	end

	scenario 'registered user can login' do
		sign_in(email: 'merve@test.com', password: '1234')
		expect(page).to have_content "Welcome, merve@test.com!"
	end

end
