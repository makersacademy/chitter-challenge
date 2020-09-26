require 'users'
require 'database_helpers'

describe Users do

  before do
    truncates
  end

  it 'creates a new user' do
    user = Users.create(name: 'test name', email: 'test@email.com', password: 'pword123', username: 'test_username')
    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a Users
    expect(user.username).to eq 'test_username'
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = test_user
      result = Users.find(user.id)
  
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(Users.find(nil)).to eq nil
    end
  end

end
