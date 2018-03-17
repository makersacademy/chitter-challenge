require 'user'

describe User do
  describe '#create' do
  it 'creates a new user' do
    user = User.create(username: 'Tester', email: 'test@example.com', password: 'password123')
    expect(user.id).not_to be_nil
  end
end
end
