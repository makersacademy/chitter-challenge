require_relative '../../lib/user'
require 'pg'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.new('Bart', 'bart@conures.com','2', 'parrots1')
      User.create('Bart', 'bart@conures.com', 'parrots1')
      expect(user).to be_an_instance_of User
      expect(User.all[1].name).to eq 'Bart'
      expect(User.all[1].email).to eq 'bart@conures.com'
    end
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('parrots1')
      User.create('Bart', 'bart@conures.com', 'parrots1')
    end
  end

  describe '.find_name_by_id' do
    before do
      clear_table
    end
    it 'finds a user by ID' do
      DBConnection.connection.exec("INSERT INTO users (name, email, password, id) VALUES ('Bart', 'bart@conures.com', 'parrots1', '100');")
      result = User.find_name_by_id('100')
      expect(result.first['name']).to eq 'Bart'
    end
    it 'returns nil if there is no ID given' do
      expect(User.find_name_by_id(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      DBConnection.connection.exec("INSERT INTO users (name, email, password, id) VALUES ('Bart', 'bart@conures.com', 'parrots1', '234');")
      authenticated_user = User.authenticate('bart@conures.com', 'parrots1')
      expect(authenticated_user.first['id']).to eq '234'
    end
  end
end
