require 'user'

describe User do
  it 'creates a new user' do
    user = User.create(first_name: "John", last_name: "Doe",
                       email: "test@example.com", password: "password123",
                       user_name: "JohnDoe")

    expect(user.first_name).to eq "John"
    expect(user.last_name).to eq "Doe"
    expect(user.email).to eq "test@example.com"
    expect(user.user_name).to eq "JohnDoe"
  end

  describe '.find' do
    
  it 'finds a user by ID' do
    user = User.create(first_name: "John", last_name: "Doe",
                       email: "test@example.com", password: "password123",
                       user_name: "JohnDoe")
    result = User.find(user.id)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
  end
end
end
