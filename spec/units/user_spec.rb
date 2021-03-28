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
      encrypted_password = BCrypt::Password.create("parrots1")
      DBConnection.connection.exec("INSERT INTO users (name, email, password, id) VALUES ('Bart', 'bart@conures.com', '#{encrypted_password}', '234');")
      authenticated_user = User.authenticate('bart@conures.com', 'parrots1')
      expect(authenticated_user).to eq '234'
    end
    it 'returns an error if the email address is incorrect' do
      clear_table
      encrypted_password = BCrypt::Password.create("parrots1")
      DBConnection.connection.exec("INSERT INTO users (name, email, password, id) VALUES ('Bart', 'bart@conures.com', '#{encrypted_password}', '234');")
      expect(User.authenticate('nottherightemail@me.com', 'password123')).to be_nil
    end
    it 'returns nil given an incorrect password' do
      clear_table
      encrypted_password = BCrypt::Password.create("parrots1")
      DBConnection.connection.exec("INSERT INTO users (name, email, password, id) VALUES ('Bart', 'bart@conures.com', '#{encrypted_password}', '234');")
      expect(User.authenticate('bart@conures.com', 'wrongpassword')).to be_nil
    end
  end
end
