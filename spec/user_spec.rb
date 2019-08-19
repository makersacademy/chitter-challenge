require 'user'
require 'database_helpers'

describe '.create' do

  it 'creates a new user' do

        user = User.create(name: "Guy", password: "yoyo")
        persisted_data = persisted_data(table: 'users', id: user.id)
        expect(user).to be_a User

        expect(user.name).to eq 'Guy'
        expect(user.id).to eq persisted_data.first['id']
        expect(user.password).to eq("yoyo")
      end
    end
