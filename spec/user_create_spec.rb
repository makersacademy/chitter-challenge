# frozen_string_literal: true

describe User do
  describe '.create' do
    it 'creates a user in the database, password encrypted' do
      User.create('@a', 'B', 'c@d.com', '1234')

      connection = PG.connect(dbname: 'chitter_test')
      user = connection.exec('SELECT * FROM users;')
      password = BCrypt::Password.new(user[0]['password'])

      expect(user[0]['username']).to eq('@a')
      expect(user[0]['name']).to eq('B')
      expect(user[0]['email']).to eq('c@d.com')
      expect(user[0]['password']).to eq(password)
    end
  end

  describe '.format_username' do
    it 'adds @ to the username if missing' do
      User.format_username('a')

      expect(User.username).to eq('@a')
    end
  end
end
