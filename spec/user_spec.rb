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

	describe '.authenticate' do
		it 'A user can log in' do
			user = User.create(name: 'test4', u_name: 'u_test4', email: 'test4@test.com', password: 'test1234')
			authenticated_user = User.authenticate(email: 'test4@test.com', password:'test1234')
			expect(authenticated_user.id).to eq user.id
		end

		it 'returns nil given wrong email' do
			user = User.create(name: 'test6', u_name: 'u_test6', email: 'test6@test.com', password: 'test1234')
			expect(User.authenticate(email: 'test62@test.com', password: 'password')).to be_nil
		end

		it 'return nil given wrong password' do
			user = User.create(name: 'test7', u_name: 'u_test7', email: 'test7@test.com', password: 'test1234')
			expect(User.authenticate(email: 'test7@test.com', password: 'password12')).to be_nil
		end
	end
end