require './app/models/user'

describe User do
  let(:user) do
    User.new(name: 'John Smith', username: 'JSmith', password: 'password123', email_address: 'test123@123email.com')
  end
    it 'authenticates when given a valid email address and password' do
      user.save!
      authenticated_user = User.authenticate(user.email_address,user.password)
      expect(authenticated_user).to eq user
    end
    it 'does not authenticate when given an incorrect passsword' do
      expect(User.authenticate(user.email_address, "wrong_password")).to be_nil
    end
end
