require './lib/user.rb'

describe User do
  it "creates a new user" do
    user = User.create(name: 'Test test', username: 'Test', email: 'test@example.com', password: 'password123')
    expect(user.id).to eq 1
    expect(User.all.count).to eq 1
  end
end
