describe User do
  let!(:user) do
    User.create(email: 'me@me.com',
                password: "secret",
                password_confirmation: "secret",
                username: "Me")
  end
  
  it 'Has a password field' do
    expect(user.email).to eq 'me@me.com'
  end
  
  it 'Has a username field' do
    expect(user.username).to eq 'Me'
  end
  
  it 'Cannot be retrieved with the wrong credentials' do
    user_wrong = User.authenticate("me@me", "random")
    expect(user_wrong).to be_nil
  end
  
  it 'Can be used to sign in with the right credentials' do
    user_right = User.authenticate("me@me.com", "secret")
    expect(user_right).to be_a User 
  end
end