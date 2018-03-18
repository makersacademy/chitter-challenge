require 'user'

describe User do

  let(:mock_connection) {
    double :DatabaseConnection,
    query: [{ 'fullname' => 'test', 'username' => 'test', \
      'email' => 'test@gmail.com', 'password' => 'password' }]
  }
  let(:mock_connection_no_return) {
    double :DatabaseConnection,
    query: []
  }

  describe '#self.sign_in' do
    it 'messages the database to return the user associated '\
    'with a given email' do
      User.setup(mock_connection)
      email = 'test@gmail.com'
      password = 'password'
      expect(mock_connection).to receive(:query).with\
      ("SELECT * FROM users WHERE email = '#{email}'")
      User.sign_in(email, password)
    end
    it 'returns an error when it cannot find the user by email' do
      User.setup(mock_connection_no_return)
      email = 'not_right@gmail.com'
      password = 'password'
      expect(User.sign_in(email, password)).to eq 'Email address not registered'
    end
    it 'allows a user with the right credentials to sign in, '\
    'returning false' do
      User.setup(mock_connection)
      email = 'test@gmail.com'
      password = 'password'
      expect(User.sign_in(email, password)).to eq false
    end
    it 'allows a user with the right credentials to sign in, '\
    'creating a user object' do
      User.setup(mock_connection)
      email = 'test@gmail.com'
      password = 'password'
      User.sign_in(email, password)
      expect(User.current_user).to be_an_instance_of(described_class)
    end
    it 'allows a user with the right credentials to sign in, '\
    'returning a user object' do
      User.setup(mock_connection)
      email = 'test@gmail.com'
      password = 'wrong'
      expect(User.sign_in(email, password)).to eq 'Incorrect password'
    end
  end

  describe '#self.sign_out' do
    it 'resets current user to nil on signout' do
      User.setup(mock_connection)
      email = 'test@gmail.com'
      password = 'password'
      User.sign_in(email, password)
      user = User.current_user
      expect { User.sign_out }.to change { User.current_user }.from(user).to(nil)
    end
  end

  describe '#self.add' do
    it 'messages the database to add a user' do
      User.setup(mock_connection)
      fullname = 'Gareth A Test'
      username = 'Testy G'
      email = 'test@gmail.com'
      password = 'password'
      expect(mock_connection).to receive(:query).\
      with("INSERT INTO users (fullname, username, email, password) "\
      "VALUES ('#{fullname}', '#{username}', '#{email}', '#{password}')")
      User.add(fullname, username, email, password)
    end
  end

end
