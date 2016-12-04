require 'spec_helper'
require './app/models/user'

describe User do

	let!(:user) do
		User.create(firstname: 'John',
			surname: 'Doe',
			email: 'john@doe.com',
			username: 'JayDawg',
			password: 'password123',
			password_confirmation: 'password123')
	end

	it 'authenticates user when email and password is valid' do
		authenticated_user = User.authenticate(user.email, user.password)
		expect(authenticated_user).to eq user
	end

	it 'does not authenticate user when email is invalid' do
		expect(User.authenticate('wrong@email.com', user.password)).to be_nil
	end

	it 'does not authenticate user when password is invalid' do
		expect(User.authenticate(user.email, 'wrongpassword')).to be_nil
	end

end