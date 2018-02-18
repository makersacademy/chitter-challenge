require 'user'

describe User do
  describe '::sign_up' do
    it 'sign up adds user information to the database' do
      email = 'marcus@gmail.com'
      password = 'password123'
      name = 'Marco Polo'
      username = 'MarcoPo'
      new_user = described_class.sign_up(email, password, name, username)
      expect(described_class.all).to include new_user
    end

    it 'has information of signed up user' do
      email = 'marcus@gmail.com'
      password = 'password123'
      name = 'Marco Polo'
      username = 'MarcoPo'
      described_class.sign_up(email, password, name, username)
      expect(described_class.last(:name => 'Marco Polo').email).to eq 'marcus@gmail.com'
    end
  end
end
