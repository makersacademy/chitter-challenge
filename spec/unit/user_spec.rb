require 'user'
require 'database_helpers'

describe User do
    describe '.create' do
        it 'create a new user' do
            user = User.create(email: 'test@chitter.com', password: 'password')
            persisted_data = persisted_data(table: :users, id: user.id)

            expect(user).to be_a User
            expect(user.id).to eq persisted_data['id']
            expect(user.email).to eq 'test@chitter.com'
        end
    end

    describe '.find' do
        it 'finds a user by ID' do
          user = User.create(email: 'test@chitter.com', password: 'password')
          result = User.find(id: user.id)
          expect(result.id).to eq user.id
          expect(result.email).to eq user.email
        end
    end
end