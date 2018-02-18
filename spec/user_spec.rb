describe ".all" do

  it "returns all users, wrapped in a user instance" do
    user = User.create(name: 'Jim', username: 'Jimmy',
    email: 'abc@123.com', password: 'abc123')

    expect(User.all.map(&:id)).to include user.id
  end

end

describe ".create" do
  it "creates a new user" do
    user = User.create(name: 'Jim', username: 'Jimmy',
    email: 'abc@123.com', password: 'abc123')

    expect(user.id).not_to be_nil
  end
end

describe ".find" do

  it "finds a user by id" do
    user = User.create(name: 'Jim', username: 'Jimmy',
      email: 'abc@123.com', password: 'abc123')
    expect(User.find(user.id).username).to eq user.username
  end

  it "returns nil if there is no ID given" do
    expect(User.find(nil)).to eq nil
  end

end
