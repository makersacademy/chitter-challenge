describe User do
  let(:user) do
    User.create(full_name: 'user test', username: 'test', email: 'test@test.com', password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

end
