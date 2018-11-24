require 'user'
require 'database_helpers'

describe User do
	describe '.create' do
		it 'create a new user' do
			user = User.create(name: 'test', u_name: 'u_test', email: 'test@test.com', password: 'test1234')
			persisted_data = persisted_data(id: user.id, table: 'users')
			expect(user).to be_a User
			expect(user.id).to eq persisted_data.first['id'] 
		end
	end

	describe '.find' do
		it 'find an user' do
			user = User.create(name: 'test2', u_name: 'u_test2', email: 'test2@test.com', password: 'test1234')
			result = User.find(id: user.id)
			expect(result.id).to eq user.id
			expect(result.name).to eq user.name
		end

		it 'Return nil if there is no user id' do
			expect(User.find(id: nil)).to eq nil
		end
	end
end