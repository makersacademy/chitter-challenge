require 'spec_helper'

feature 'log in existing user' do
	let!(:user) do
		User.create(email: 'user@example.com',
		password: 'secret1234', username: 'user1')
	end

	def sign_in(email:, password:)
		visit '/'
		fill_in :email, with: email
		fill_in :password, with: password
		click_button('Sign in!')
	end

	scenario 'registered user can login' do
		sign_in(email: user.email, password: user.password)
		expect(page).to have_content "Welcome, #{user.email}!"
	end

end
