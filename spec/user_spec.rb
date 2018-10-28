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
    let(:check_user) { CheckUsers.all.first }

    it 'creates a user in the db' do
      User.create(details)
      expect(check_user.name).to eq details[:name]
      expect(check_user.username).to eq details[:username]
      expect(check_user.email).to eq details[:email]
      expect(check_user.password).to eq details[:password]
    end
  end
end
