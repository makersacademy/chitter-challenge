describe User do

 let(:user){ create :user}

 it 'authenticates when given a valid email address and password' do
   authenticated_user = User.authenticate(user.handle, user.password)
   expect(authenticated_user).to eq user
 end

end
