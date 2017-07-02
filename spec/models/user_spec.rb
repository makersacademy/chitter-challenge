
describe User do

  let!(:user) do
   User.create(email: 'j.kingharman@googlemail.com', password: 'fake',
              password_confirmation: 'fake', name: "Jas", username: "J")
   end

 it 'authenticates when given right user info (email, pass)' do
   authenticated_user = User.authenticate(user.email, user.password)
   expect(authenticated_user).to eq user
 end
end
