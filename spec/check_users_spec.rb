require 'check_users'

describe CheckUsers do
  let(:details) { { name: "Caitlin", username: "Caitlincooling", email: "caitlin@test.com", password: "caitlin123" } }

  describe '::all' do
    let(:check_users) { CheckUsers.all.first }

    it 'returns an instance of user that has a name' do
      User.create(details)
      expect(check_users.name).to eq details[:name]
    end
  end

  describe '::exists?' do
    it 'Checks if a username is already in the db' do
      expect(CheckUsers.exists?(details[:username], details[:email])).to eq false
      User.create(details)
      expect(CheckUsers.exists?(details[:username], "c123@test.com")).to eq true
    end

    it 'checks if an email is already in the db' do
      expect(CheckUsers.exists?(details[:username], details[:email])).to eq false
      User.create(details)
      expect(CheckUsers.exists?("Ccooling", details[:email])).to eq true
    end
  end

  describe '::login' do
    it 'checks that the email and password given match a row in the db' do
      User.create(details)
      expect(CheckUsers.login(details[:email], details[:password])).to eq details[:username]
    end

    it 'checks that an incorrect email and password dont exist' do
      User.create(details)
      expect(CheckUsers.login("cait@test.com", 'password')).to eq false
    end
  end
end
