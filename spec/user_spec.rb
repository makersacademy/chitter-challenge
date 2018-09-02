require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create('test@example.com', 'password123')
    expect(user.id).not_to be_nil
  end
end

describe '.all' do
  it 'returns all users, wrapped in a User instance' do
    User.create('test@example.com', 'password123')
    user = User.all.map { |object| object.id }
    expect(user.id).to include user.id 
  end
end
