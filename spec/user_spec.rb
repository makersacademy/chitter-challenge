describe User do
  it 'authenticates a user with valid information' do
    user = create(:user)
    expect(User.authenticate(user.email, user.password)).to eq(user)
  end
end
