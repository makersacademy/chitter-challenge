describe User do
  it 'can retrieve users details from database' do
    test_user = User.all.first
    expect(test_user.email).to eq('user@test.com')
    expect(test_user.password).to eq('user1234')
    expect(test_user.name).to eq('User1')
    expect(test_user.username).to eq('user1')
  end
end
