describe User do

  let!(:user) do
    User.create(email: 'joe@email.com', password: '1234',
    password_confirmation: '1234')
  end

  it 'authenticates a correct email and password combo is entered' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
  it 'does not authenticate when an incorrect email and password combo is entered' do
  expect(User.authenticate(user.email, 'wrongpword')).to be_nil
end

end
