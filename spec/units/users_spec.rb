require 'users'

describe Users do
  it 'can find a user by id' do
    user = Users.create(username: 'name1', email: 'test@me.com', password: 'password123')
    found_user = Users.find(1)
    expect(found_user.id).to eq user.id
    expect(found_user.email).to eq user.email
    expect(found_user.username).to eq user.username
  end

  it '.find method returns nil if no user given' do
    expect(Users.find(nil)).to eq nil
  end

  it 'user.id returns an integer' do
    user = Users.create(username: 'name1', email: 'test@me.com', password: 'password123')
    expect(user.id).to be_a Integer
  end

  it 'can authenticate a user when signing in' do
    user = Users.create(username: 'name1', email: 'test@me.com', password: 'password123')
    authenticated_user = Users.authenticate(username: 'name1', password: 'password123')
    expect(authenticated_user.id).to eq user.id
  end

  it 'returns nil if wrong authentications details are given' do
    user = Users.create(username: 'name1', email: 'test@me.com', password: 'password123')
    expect(Users.authenticate(username: 'name2', password: 'password123')).to be_nil
  end
end
