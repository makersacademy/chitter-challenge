require './lib/user'

describe User do

  expected_users = [
    User.new(
      id: '1',
      email: 'peter_test@test.com',
      user_name: 'Peter'
    )
  ]

  expected_users_2 = [
    User.new(
      id: '1',
      email: 'peter_test@test.com',
      user_name: 'Peter'
    ),
    User.new(
      id: '2',
      email: 'donna_test@test.com',
      user_name: 'Donna'
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
      create_user
      User.update(id: '1', user_name: 'Peter_Star', email: 'peter__star_test@test.com')

      users = User.all
      expect(users[0].user_name).not_to eq('Peter')
      expect(users[0].email).not_to eq 'peter_test@test.com'
      expect(users[0].user_name).to eq('Peter_Star')
      expect(users[0].email).to eq('peter__star_test@test.com')
    end
  end

  describe '.find' do

    it 'finds user by id' do
      create_users
      found_user = User.find(2)
      expect(found_user.id).to eq(expected_users_2[1].id)
      expect(found_user.email).to eq(expected_users_2[1].email)
      expect(found_user.user_name).to eq(expected_users_2[1].user_name)
    end
  end

  describe '.login' do
    it 'returns a user given a correct username and password, if one exists' do
      create_users
      logined_user = User.login(email: 'donna_test@test.com', password: 'donna12345')
      expect(logined_user.id).to eq(expected_users_2[1].id)
    end
  end

  describe '.uniqe?' do
    it 'returns false if user_name && email are not unique' do
      create_users
      expect(User.unique?(user_name: 'Donna', email: 'donna_test@test.com')).to eq(false)
    end
    it 'returns false if user_name is not uniqu && email is unique' do
      create_users
      expect(User.unique?(user_name: 'Donna', email: 'elena_test@test.com')).to eq(false)
    end
    it 'returns false if user_name is uniqu && email is not unique' do
      create_users
      expect(User.unique?(user_name: 'Elena', email: 'donna_test@test.com')).to eq(false)
    end
    it 'returns true if user_name && pemail are unique' do
      create_users
      expect(User.unique?(user_name: 'Elena', email: 'elena_test@test.com')).to eq(true)
    end
  end
  describe '.unique_user_name?' do
    it 'returns false if user_name is not unique' do
      create_users
      expect(User.unique_user_name?(user_name: 'Donna')).to eq(false)
    end
    it 'returns true if user_name is unique' do
      create_users
      expect(User.unique_user_name?(user_name: 'Elena')).to eq(true)
    end
  end
  describe '.unique_user_email?' do
    it 'returns false if email is not unique' do
      create_users
      expect(User.unique_user_email?(email: 'donna_test@test.com')).to eq(false)
    end
    it 'returns true if email is unique' do
      create_users
      expect(User.unique_user_email?(email: 'elena_test@test.com')).to eq(true)
    end
  end
end
