describe User do

  let!(:user) do
    User.create(email: 'rafa@nadal.com', password: 'givemeclay',
               password_confirmation: 'givemclay')
  end

  # it 'authenticates when given a valid email address and password' do
  #   authenticated_user = User.authenticate(user.email, user.password)
  #   expect(authenticated_user).to eq user
  # end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'nowhere_close_to_it')).to be_nil
  end

end
