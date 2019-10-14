require 'user'

describe User do
  describe '.create' do
    it 'adds a user to the database' do
      user = User.create(email: 'zaira@me.org', password: '1234', name: 'Zaira Rasool', username: 'zraso')

      expect(user.name).to include 'Zaira Rasool'
      expect(user.username).to include 'zraso'
    end
  end
end
