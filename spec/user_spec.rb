require './lib/user'

describe User do

  expected_users = [
    User.new(
      id: '1',
      email: 'peter_test@test.com',
      user_name: 'Peter'
    )
  ]

  describe '.all' do
    it 'returns all users' do
      create_user
      users = User.all
      expect(users.count).to eq(expected_users.count)
      expect(users[0].id).to eq(expected_users[0].id)
      expect(users[0].email).to eq(expected_users[0].email)
      expect(users[0].user_name).to eq(expected_users[0].user_name)
    end
  end

  describe '.create' do
    it 'creats a new user' do
      create_user
      expect(User.all.last.user_name).to eq('Peter')
    end
  end

  describe '.update' do
    it 'updates user_name and emai' do
    end
  end
end
