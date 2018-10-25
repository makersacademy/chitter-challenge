require 'user'
require 'pg'

describe User do
  describe '#intialize' do
    let(:user) { User.new( name: "Caitlin", username: "Caitlincooling", email: "caitlin@test.com", password: "caitlin123" ) }

    it 'has name, username, email and password' do
      expect(user.name).to eq "Caitlin"
      expect(user.username).to eq "Caitlincooling"
      expect(user.email).to eq "caitlin@test.com"
      expect(user.password).to eq "caitlin123"
    end
  end

  describe '::create' do
    it 'creates a user in the db' do
      User.create( name: "Caitlin", username: "Caitlincooling", email: "caitlin@test.com", password: "caitlin123" )
      user = User.all.first
      expect(user.name).to eq "Caitlin"
      expect(user.username).to eq "Caitlincooling"
      expect(user.email).to eq "caitlin@test.com"
      expect(user.password).to eq "caitlin123"
    end
  end

  describe '::all' do
    it 'returns an instance of user that has a name' do
      User.create(name: "Caitlin", username: "Caitlincooling", email: "caitlin@test.com", password: "caitlin123")
      user = User.all.first
      expect(user.name).to eq "Caitlin"
    end
  end
end
