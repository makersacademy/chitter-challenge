describe User do
   let!(:user) do
     User.create(name: 'John', username: 'j.smith',
                 email: 'john@example.com', password: '123456',
                 password_confirmation: '123456')
   end

   it 'logs in when the correct email and password are entered' do
     authenticated_user = User.authenticate(user.email, user.password)
     expect(authenticated_user).to eq user
   end

   it 'does not login when given an incorrect password' do
   expect(User.authenticate(user.email, 'wrong_password')).to be_nil
 end
end
