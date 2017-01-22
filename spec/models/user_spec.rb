describe User do

let!(:user) do
User.create(name: 'test', email: 'test@test.com', password: 'password01', password_confirmation: 'password01')
end

it 'authenticates when details entered correctly' do
  authenticated_user = User.authenticate(user.email, user.password)
  expect(authenticated_user).to eq user
end

it "doesn't authenticate if there's an issue" do
expect(User.authenticate(user.email, 'wrongpassword')).to be_nil
end


end
