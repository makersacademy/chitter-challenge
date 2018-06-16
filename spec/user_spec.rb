describe User do
  describe '.all' do
    it 'returns all the users' do
      user_1 = User.create(email: "one@yahoo.com", password: 'one', name: 'One',
         username: 'User_One')
      user_2 = User.create(email: "two@yahoo.com", password: 'two', name: 'Two',
         username: 'User_Two')
      user_3 = User.create(email: "three@yahoo.com", password: 'three',
        name: 'Three', username: 'User_Three')

      expected_users = [
        user_1,
        user_2,
        user_3
      ]

      expect(User.all).to eq expected_users
    end
  end

  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: "fake@yahoo.com", password: 'fake', name: 'Fake',
        username: 'User_Fake')
      expect(User.all).to include user
    end
  end

  describe '#==' do
    it 'two users are equal if their ids match' do
      user_1 = User.new(1, "test@yahoo.com", 'test', 'Test',username: 'User_Test')
      user_2 = User.new(1, "test@yahoo.com", 'test', 'Test',username: 'User_Test')

      expect(user_1).to eq user_2
    end
  end
end
