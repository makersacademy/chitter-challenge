describe User do

  it 'returns its id, name, username, email and password' do
    user = User.new(id: 1, name: 'Ellis', username: 'ellischitter', email: 'ellis@ellis.com', password: 'ellis123')
    expect(user.id).to eq(1)
    expect(user.name).to eq("Ellis")
    expect(user.username).to eq('ellischitter')
    expect(user.email).to eq("ellis@ellis.com")
    expect(user.password).to eq("ellis123")
  end

  it 'adds a new user to the database' do
    User.sign_up(name: 'Ellis', username: 'ellischitter', email: 'ellis@ellis.com', password: 'ellis123')
    user = User.last
    expect(user.name).to eq("Ellis")
    expect(user.username).to eq('ellischitter')
    expect(user.email).to eq("ellis@ellis.com")
    expect(user.password).to eq("ellis123")
  end
end
