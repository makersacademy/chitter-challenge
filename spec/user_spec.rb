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

  it "hashes the password using BCrypt" do
    expect(BCrypt::Password).to receive(:create).with("abc123")
    User.create(name: 'Jim', username: 'Jimmy',
      email: 'abc@123.com', password: 'abc123')
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

describe ".authenticate" do

  it "returns a user given a correct username and password (if exists)" do
    user = User.create(name: 'Jim', username: 'Jimmy',
      email: 'abc@123.com', password: 'abc123')
    authenticated_user = User.authenticate("abc@123.com", "abc123")

    expect(authenticated_user.id). to eq user.id
  end

  it "returns nil if given an incorrect email" do
    User.create(name: 'Jim', username: 'Jimmy',
      email: 'abc@123.com', password: 'abc123')
    expect(User.authenticate("incorrect@email.com", "abc123")).to be_nil
  end

  it "returns nil if given an incorrect password" do
    User.create(name: 'Jim', username: 'Jimmy',
      email: 'abc@123.com', password: 'abc123')
    expect(User.authenticate("abc@123.com", "hunter2")).to be_nil
  end
end
