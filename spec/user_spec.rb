describe User do

  it "checks the login password against the stored password" do
    user_stored = User.create(email: 'test@test.com', password: 'test', password_confirmation: 'test', name: 'Ex Name', username: 'ename')
    user_signin = User.authenticate(user_stored.email, user_stored.password)
    expect(user_signin).to eq user_stored
  end

end
