require 'users'

describe Users do
  describe '.create' do
    it 'has user details' do
      email = 'email@email.com'
      pw = 'password'
      name = 'name'
      Users.create(email: email, password: pw, name: name)

      result = DatabaseConnection.query("SELECT * FROM users").first['name']
      expect(result).to eq name
    end
  end
end
