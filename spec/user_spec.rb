require 'user'

describe User do
  describe '.create' do
    it 'should create a chitter user with login details' do
      DatabaseConnection.query("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
      User.create('Pikachu', 'Mighty Pikachu', 'pikachu@gmail.com', '13579pikapika')
      result = DatabaseConnection.query("SELECT * FROM users WHERE id='1';")

      expect(result[0]['u_name']).to eq 'Pikachu'
      expect(result[0]['username']).to eq 'Mighty Pikachu'
      expect(result[0]['u_email']).to eq 'pikachu@gmail.com'
    end
  end
end
