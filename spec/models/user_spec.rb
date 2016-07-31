describe User do

  let!(:user) do
    User.create(user_name: 'CONDOTH1', email: 'thady@example.com',
    name: 'Thady Condon', password: 'hungover!',
    password_confirmation: 'hungover!')
  end

  it "authenticates user when given correct details" do
    authenticated_user = User.authenticate(user.user_name, user.password)
    expect(authenticated_user).to eq user
  end

  it "doesn't authenticate user is given wrong name" do
    expect(User.authenticate(user.user_name, 'wrong_name')).to be_nil
  end

  it "creates and stores a password token" do
    expect{user.generate_token}.to change{user.password_token}
  end

  it "saves token time when generated" do
    Timecop.freeze do
      user.generate_token
      expect(user.password_token_time).to eq Time.now
    end
  end

  it "user is retrieved with a valid token" do
    user.generate_token
    expect(User.find_by_valid_token(user.password_token)).to eq user
  end

  it "user not retrieved with an invalid token"do
    user.generate_token
    Timecop.travel(60 * 60 + 1) do
      expect(User.find_by_valid_token(user.password_token)).to eq nil
    end
  end
end
