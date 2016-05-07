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

  it {is_expected.to respond_to(:authenticate).with(3).arguments}
  describe '#authenticate' do
    it "returns nil if user name or email do not match" do
      expect(user.authenticate 'wrong', email, password).to be_nil
      expect(user.authenticate user_name, 'wrong', password).to be_nil
    end

    it "returns nil if password doesn't match" do
      expect(user.authenticate user_name, email, 'wrong').to be_nil
    end
  end

end
