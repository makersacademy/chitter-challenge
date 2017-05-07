describe User do
  it 'creates a new user' do
    user = User.create(name: 'ahmed', email: 'funky@gmail.com', user_name: 'stubz64')
    expect(user.name).to eq 'ahmed'
    expect(user.email).to eq 'funky@gmail.com'
    expect(user.user_name).to eq 'stubz64'
  end
end
