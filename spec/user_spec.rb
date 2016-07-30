require './app/models/user.rb'

describe User do
  context "valid e-mail and password" do
    it "authenticates user" do
      user = User.create(email: "bob@gmail.com", password: 123)
      authenticated_user = User.authenticate("bob@gmail.com", 123)
      expect(authenticated_user).to eq user
    end
  end
  context "invalid e-mail and password" do
    it "does not authenticate user" do
      user = User.create(email: "bob@gmail.com", password: 123)
      expect(User.authenticate("bob@gmail.com", "wrong password")).to be_nil
    end
  end
end

# describe User do
#
#   let!(:user) do
#     User.create(email: 'test@test.com', password: 'secret1234')
#   end
#
#   it 'authenticates when given a valid email address and password' do
#     authenticated_user = User.authenticate(user.email, user.password)
#     expect(authenticated_user).to eq user
#   end
#
#   it 'does not authenticate when given an incorrect password' do
#     expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
#   end
#
# end
