describe User do

 let!(:user) do
   User.create(email: 'faisal@gmail.com', password: 'burgerking2',
               password_confirmation: 'burgerking2')
 end

 it 'authenticates user' do
   authenticated_user = User.authenticate(user.email, user.password)
   expect(authenticated_user).to eq user
 end

end
