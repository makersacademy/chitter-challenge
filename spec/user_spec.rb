require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: "jl7e12@gmail.com", password: "password123", name: "cindyliu", username: "Cindy")
      expect(user.id).not_to be_nil
    end
  end

  describe '.all' do
  it 'returns all users, wrapped in a User instance' do
    user = User.create(email: "jl7e12@gmail.com", password: "password123", name: "cindyliu", username: "Cindy")

    expect(User.all.map(&:id)).to include user.id
  end
end
end
