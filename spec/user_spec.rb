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

  describe '::exists?' do
    it 'Checks if a username is already in the db' do
      expect(User.exists?("Caitlincooling", "caitlin@test.com")).to eq false
      User.create(details)
      expect(User.exists?("Caitlincooling", "c123@test.com")).to eq true
    end

    it 'checks if an email is already in the db' do
      expect(User.exists?("Caitlincooling", "caitlin@test.com")).to eq false
      User.create(details)
      expect(User.exists?("Ccooling", "caitlin@test.com")).to eq true
    end
  end
end
