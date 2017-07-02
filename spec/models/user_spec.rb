describe User do

  let!(:user) do
    User.create(email: 'example@gmail.com.com',
                name: 'Exmaple Newname',
                username: 'Nametest1',
                password: 'examplepass1',
                password_confirmation: 'examplepass1')
  end

  it 'authenticates the user when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
  it 'does not authenticate when the password is incorrect' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end
end
