describe User do

  let(:user) { User.create(name: 'Mannie', username: 'mannieg',
                password: 'test', password_confirm: 'test',
                email: 'mannieg@googlemail.com')}

  it 'returns the user object after authentication' do
    expect(User.authenticate(username: user.username, password: 'test')).to be_kind_of User
  end

  it 'does not authenticate on incorrect password' do
    expect(User.authenticate(username: user.username, password: 'wrong')).to eq nil
  end
end
