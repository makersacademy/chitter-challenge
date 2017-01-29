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
#     expect(user.authenticate(user.email, 'incorrect_password')).to be_nil
#   end
#
# end
