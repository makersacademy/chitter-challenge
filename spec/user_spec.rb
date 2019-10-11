require 'user'

describe User do

  let(:email) { 'test@example.com' }
  let(:password) { 'pass123' }
  let(:name) { 'Melvin Lau' }
  let(:username) { 'melvinlau' }

  describe '.create' do

    it 'creates a new user' do

      user = User.create(
        email: email,
        password: password,
        name: name,
        username: username
      )

      result = DBConnection.query("SELECT * FROM users WHERE id = '#{user.id}';")

      expect(user).to be_a User
      expect(user.id).to eq result[0]['id']
      expect(user.username).to eq result[0]['username']

    end

  end

end
