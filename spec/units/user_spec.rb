require 'user'

describe User do
  it 'shows all users' do
    user = described_class.create(username: 'Daniel', email: 'example@test.com', password: '12345')
    expect(User.all.map(&:id)).to include user.id
  end
  it 'creates a new user' do
    user = described_class.create(username: 'Daniel', email: 'example@test.com', password: '12345')
    expect(user.id).not_to be nil
  end

  it 'finds a user by ID' do
    user = described_class.create(username: 'Daniel', email: 'example@test.com', password: '12345')
    expect(User.get(user.id).email).to eq user.email
  end

  it 'logs in a previous user if email and password combo exists' do
     user = described_class.create(username: 'Daniel', email: 'example@test.com', password: '12345')
    expect(User.authenticate(user.email, '12345')).to eq user
  end
end
