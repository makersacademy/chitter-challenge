# describe User do

#   let!(:user) { User.create }

#   it 'authenticates when given a valid email and password' do
#     authenticated_user = User.authenticate(email: "alice@test.com" password: "secret1234")
#     expect(authenticated_user).to eq user
#   end

#   it 'does not authenticate when given an incorrect password' do
#     authenticated_user = User.authenticate(email: user.email, password: 'wrong_password')
#     expect(authenticated_user).to be_nil
#   end

# end