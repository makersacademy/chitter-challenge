describe User do

  let!(:user) do
    User.create(email: 'test@test.com',
                password: 'secret123',
                password_confirmation: 'secret123')
  end

  describe "has attributes of" do
    it "email and password" do
      expect(user).to have_attributes(email: 'test@test.com')
      expect(user).to have_attributes(password: 'secret123')
    end
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end

end
