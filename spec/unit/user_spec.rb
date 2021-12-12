require 'user'
require 'bcrypt'

describe User do
	
	context "#create method" do
		it 'creates a new user' do
			user = User.create(email: 'batman@gotham.com', password: 'qwerty')

			expect(user).to be_a User
			expect(user.email).to eq 'batman@gotham.com'
		end

		it 'hashes the password using BCrypt gem' do
			expect(BCrypt::Password).to receive(:create).with('qwerty12345')
			
			User.create(email: 'batman@gotham.com', password: 'qwerty12345')
		end
	end

	context '.get' do
		it 'gets a user by ID' do
			user = User.create(email: 'batman@gotham.com', password: 'qwerty')
			result = User.get(id: user.id)
	
			expect(result.id).to eq user.id
			expect(result.email).to eq user.email
		end

		it 'returns nil if there is no ID given' do
			expect(User.get(id: nil)).to eq nil
		end
	end

	context "#authentication" do
		it 'returns a user given a correct email & password' do
			test_user = User.create(email: 'batman@gotham.com', password: 'qwerty')
			authenticated_user = User.authenticate(email: 'batman@gotham.com', password: 'qwerty')

			expect(authenticated_user.id).to eq test_user.id
		end

		it 'returns nil if the incorrect email is detected' do
			user = User.create(email: 'batman@gotham.com', password: 'password123')
    	expect(User.authenticate(email: 'joker@gotham.com', password: 'password123')).to be_nil
		end

		it 'returns nil given an incorrect password' do
			user = User.create(email: 'test@example.com', password: 'password123')
	
			expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
		end
	
	end

end