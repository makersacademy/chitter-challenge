describe User do


  it 'authenticates when given a valid email address and password' do
    user = User.create(email_address: 'test@test.com', password: 'secret1234',password_confirmation: 'secret1234')
    authenticated_user = User.authenticate(user.email_address, user.password)
    expect(authenticated_user).to eq user
  end

end
