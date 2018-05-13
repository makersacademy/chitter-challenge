require 'user'

describe User do

  let(:database_connection) { DatabaseConnection }
  subject(:user) { described_class.new(id: 1, email: "jonny@gmail.com", password: "pass123", user_name: "jonny", name: "Jon") }

  describe 'initialize' do
    it 'creates an instance of a user' do
      expect(user.id).to eq 1
      expect(user.name).to eq 'Jon'
      expect(user.user_name).to eq 'jonny'
      expect(user.email).to eq 'jonny@gmail.com'
      expect(user.password).to eq 'pass123'
    end
  end

  before do
    described_class.create(email: 'jonny@gmail.com', password: 'pass123', user_name: 'jonny', name: 'Jon')
    described_class.create(email: 'gemma@gmail.com', password: 'pass333', user_name: 'gem', name: 'Gemma')
  end

  describe '.create' do
    it 'creates user record in database' do
      users = User.all
      emails = users.map(&:email)
      passwords = users.map(&:password)
      user_names = users.map(&:user_name)
      names = users.map(&:name)
      expect(emails).to include 'jonny@gmail.com'
      expect(emails).to include 'gemma@gmail.com'
      expect(passwords).to include 'pass333'
      expect(passwords).to include 'pass123'
      expect(user_names).to include 'gem'
      expect(user_names).to include 'jonny'
      expect(names).to include 'Gemma'
      expect(names).to include 'Jon'
    end
  end

  describe '.all' do
    it 'returns users records from database' do
      expect(described_class.all[0].password).to eq 'pass123'
      expect(described_class.all[1].email).to eq 'gemma@gmail.com'
    end
  end

  describe '.find' do
    it 'finds user by id' do
      user1 = User.create(email: 'jonny@gmail.com', password: 'pass123', user_name: 'jonny', name: 'Jon')
      found_user = User.find(user1.id)
      expect(found_user[0].email).to eq 'jonny@gmail.com'
    end
  end

end
