require 'spec_helper'

feature 'user can sign up for Chitter' do


	def sign_up(email:, password:, username:)
		visit '/'
		click_button('Register')
		fill_in :email, with: email
		fill_in :password, with: password
		fill_in :username, with: username
		click_button('Sign up!')
	end

	scenario 'user enters email address, password and username to sign up' do
		sign_up(email: 'test@example.com', password: '1234', username: 'User222')
		expect(page).to have_content("Welcome, test@example.com!")
	end

	scenario 'user cannot register with an existing email' do
		expect {sign_up(email: nil, password: '1223', username: 'User121') }.not_to change(User, :count)
		expect(current_path).to eq('/user')
		expect(page).to have_content('Email must not be blank')
	end

	scenario 'I cannot sign up with an invalid email address' do
		expect { sign_up(email: "invalid@email", password: '1223', username: 'User123') }.not_to change(User, :count)
		expect(current_path).to eq('/user')
		expect(page).to have_content('Email has an invalid format')
	end

	let!(:user) do
		User.create(email: 'user@example.com',
		password: 'secret1234', username: 'user1')
	end

	scenario 'I cannot sign up with a registered email address' do
		expect {sign_up(email: 'user@example.com', password: '1234', username: 'User222')}.not_to change(User, :count)
		expect(page).to have_content('Email is already taken')
	end
end
