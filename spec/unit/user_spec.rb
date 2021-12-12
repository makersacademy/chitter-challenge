require 'user'

describe User do
	
	context "#create method" do
		it 'creates a new user' do
			user = User.create(email: 'batman@gotham.com', password: 'qwerty')

			expect(user).to be_a User
			expect(user.email).to eq 'batman@gotham.com'
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


end