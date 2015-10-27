describe User do

  let(:user) do
    User.create(email: 'test@test.com', password: 'secret1234', password_confirmation: 'secret1234', time: Time.now)
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, "user.password")
    expect(authenticated_user).to eq user
  end

  it 'doesnt authenticates when given an invalid email address and password' do
    authenticated_user = User.authenticate(user.email, "wrong")
    expect(authenticated_user).to eq nil
  end

  it "can display a time nicely" do
      expect(user.nice_time).to eq("2pm")
  end


  # it 'does not authenticate when when given an invalid email address and password' do
  #   expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  # end

end
