describe User do
  let!(:user) do
   User.create(email: 'test@test.com', password: '12345', name: 'Bob', username: 'Bob12345',
              password_confirmation: '12345')
 end

 it 'authenticates when given valid email address and password' do
   authenticated_user = User.authenticate(user.email, user.password)
   expect(authenticated_user).to eq user
 end

 it 'does not authenticate when given an incorrect password' do
  expect(User.authenticate(user.email, '123456')).to be_nil
end
end
