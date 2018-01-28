describe User do
  let!(:new_user) do
    User.create(email: '123@123.com',
                password: 'password',
                password_confirmation: 'password',
                name: 'Bob',
                username: 'Alice')
  end

  it 'Logs in when given a valid email address and password' do
    authenticated_user = User.authenticate(new_user.email, 'password')
    expect(authenticated_user).to eq new_user
  end

  it 'Does not log in when given an incorrect password' do
    expect(User.authenticate(new_user.email, 'P422w0RD')).to be_nil
  end
end
