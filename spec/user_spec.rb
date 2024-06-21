require 'user'

describe User do
  def reset_chitter_table
    seed_sql = File.read('spec/seeds.sql')
    connection = DatabaseConnection.connect
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_chitter_table
  end

  describe '.create' do
    it 'creates a new user' do
      user = User.create('ana', 'ana@example.com', 'password')
      expect(user.username).to eq 'ana'
      expect(user.email).to eq 'ana@example.com'
    end
  end

  describe '.find_by_email' do
    it 'returns the user with the given email address' do
      user = User.find_by_email('bob@gmail.com')
      expect(user.username).to eq 'bob'
    end

    it 'returns nil if no user has the given email address' do
      user = User.find_by_email('adssadsd@example.com')
      expect(user).to be_nil
    end
  end

  describe '.find_by_id' do
    it 'returns the user with the given ID' do
      user = User.find_by_id(2)
      expect(user.username).to eq 'bob'
    end

    it 'returns nil if no user has the given ID' do
      user = User.find_by_id(100)
      expect(user).to be_nil
    end
  end


end