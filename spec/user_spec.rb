# require './app/models/user'
#
# describe User do
#   let!(:user) do
#     User.create(email: 'testtest@test.com', password: 'qwerty', password_conf: 'qwerty')
#   end
#
#   it 'authenticates when given a valid email address and password' do
#     auth_user = User.authenticate(user.email, 'qwerty')
#     expect(auth_user).to eq(user)
#   end
# end
