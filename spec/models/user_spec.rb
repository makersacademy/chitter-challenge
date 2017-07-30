describe User do

  let!(:user) do
    User.create(name: 'Dave Mittens',
                email: 'dave@gmail.com',
                username: 'Cat_Peeps93',
                password: '12345',
                password_confirmation: '12345')
  end

  it 'authenticates when given valid username and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does nto authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end
