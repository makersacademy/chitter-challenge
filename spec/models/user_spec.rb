require 'spec_helper'

describe User do 

	let!(:user) do
    User.create(name: 'Dan Wheeler', username: 'd9nny',
								email: 'dan@google.com', password: 'test123', 
								password_confirmation: 'test123')
  end
  let(:password) {double "test123"}

	context 'Encryption' do
		it 'uses bcrypt to encrypt a password' do
			expect(user.password).not_to eq password
		end
	end

	describe '#authenticate' do
		it 'authenticates when given a valid username and password' do
			authenticated_user = User.authenticate(user.username, user.password)
			expect(authenticated_user).to eq user
		end

		it 'does not authenticate when given an invalid username and password' do
			authenticated_user = User.authenticate(user.username, 'wrong password')
			expect(authenticated_user).to eq nil
		end
	end
end

