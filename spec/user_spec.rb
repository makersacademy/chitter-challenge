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
      expect(User.exists?(details[:username], details[:email])).to eq false
      User.create(details)
      expect(User.exists?(details[:username], "c123@test.com")).to eq true
    end

    it 'checks if an email is already in the db' do
      expect(User.exists?(details[:username], details[:email])).to eq false
      User.create(details)
      expect(User.exists?("Ccooling", details[:email])).to eq true
    end
  end

  describe '::login' do
    it 'checks that the email and password given match a row in the db' do
      User.create(details)
      expect(User.login(details[:email], details[:password])).to eq details[:username]
    end

    it 'checks that an incorrect email and password dont exist' do
      User.create(details)
      expect(User.login("cait@test.com", 'password')).to eq false
    end
  end
end
