require './app/models/user'

describe User do
  user_name = 'the_user'
  email = 'user@example.com'
  password = 'secret1234'

  let(:user) do
  User.create user_name: user_name,
              email: email,
              password: password,
              password_confirmation: password
  end

  describe '#authenticate' do
    xit 'returns user if username and password match' do
      expect(User.authenticate user_name, password).to eq user
    end

    it "returns nil if user name does not match" do
      expect(User.authenticate 'wrong', password).to be_nil
    end

    it "returns nil if password doesn't match" do
      expect(User.authenticate user_name, 'wrong').to be_nil
    end
  end

end
