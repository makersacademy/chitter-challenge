describe User do 

  let!(:user) do
    User.create(email: 'test@test.com', 
      password:'pwd1234',
      password_confirmation: 'pwd1234')
  end

  it ' can sign if credentials are correct' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end 

  it " can't sign it credentials are incorrect" do
    expect(User.authenticate(user.email, 'incorrect')).to be_nil
  end
  
end