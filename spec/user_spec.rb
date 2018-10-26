require 'user'
require 'pg'

describe User do
  let(:details) { { name: "Caitlin", username: "Caitlincooling", email: "caitlin@test.com", password: "caitlin123" } }

  describe '#intialize' do
    let(:user) { User.new(details) }

    it 'has name, username, email and password' do
      expect(user.name).to eq details[:name]
      expect(user.username).to eq details[:username]
      expect(user.email).to eq details[:email]
      expect(user.password).to eq details[:password]
    end
  end

  describe '::create' do
    let(:user) { User.all.first }

    it 'creates a user in the db' do
      User.create(details)
      expect(user.name).to eq details[:name]
      expect(user.username).to eq details[:username]
      expect(user.email).to eq details[:email]
      expect(user.password).to eq details[:password]
    end
  end

  describe '::all' do
    let(:user) { User.all.first }

    it 'returns an instance of user that has a name' do
      User.create(details)
      expect(user.name).to eq details[:name]
    end
  end
end
