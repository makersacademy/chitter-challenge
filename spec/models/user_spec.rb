describe User do
  let(:user) { create(:user) }

  it 'Authenticates valid email and password' do
    expect(User.authenticate(user.email, user.password)).to eq user
  end

  it "Doesn't authenticate wrong email and password" do
    expect(User.authenticate(user.email, 'wrong password')).to eq nil
  end
end
