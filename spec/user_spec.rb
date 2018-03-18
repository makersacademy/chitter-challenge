require 'user'

describe User do

  let(:mock_connection) {
    double :DatabaseConnection,
    query: [ { 'fullname' => 'test', 'username' => 'test', 'email' => 'test', \
      'email' => 'test@gmail.com', 'password' => 'password' } ]
  }

  before :each do
    User.setup(mock_connection)
  end


  describe '#self.sign_in' do
    it 'messages the database to return the user associated with a given email' do
      email = 'test@gmail.com'
      password = 'password'
      expect(mock_connection).to receive(:query).with\
      ("SELECT * FROM users WHERE email=#{email}")
      User.sign_in(email, password)
    end
    xit 'allows a user with the right credentials to sign in' do
      # expect(mock_connection).
    end
  end

end
