require_relative '../app/models/user'
describe User do

  def sign_up
    User.create(name: "dan",
                email: "test@test.com",
                username: 'super_tester',
                password: 'test'
      )
  end

  it "signs up, adds a user to the database" do
    expect(described_class.count).to eq(0)
    sign_up
    expect(described_class.count).to eq(1)
  end
  it "users password is kept securely" do
    sign_up
    expect(described_class.first.password_digest).not_to eq('test')
  end
  it "fails with duplicate email" do
    expect(described_class.count).to eq(0)
    sign_up
    user = described_class.new(name: "thomas",
                               email: "test@test.com",
                               username: 'bad_tester',
                               password: 'test')
    user.save
    expect(user.errors[:email].first).to eq "Email is already taken"
    expect(described_class.count).to eq(1)
  end
  it "fails with duplicate username" do
    expect(described_class.count).to eq(0)
    sign_up
    user = described_class.new(name: "thomas",
                               email: "testerfan@lovintest.com",
                               username: 'super_tester',
                               password: 'test')
    user.save
    expect(user.errors[:username].first).to eq "Username is already taken"
    expect(described_class.count).to eq(1)
  end

  it "fails if username is blank" do
    expect(described_class.count).to eq(0)
    user = described_class.new(name: "thomas",
                               email: "testerfan@lovintest.com",
                               password: 'test')
    user.save
    expect(user.errors[:username].first).to eq "Username must not be blank"
    expect(described_class.count).to eq(0)
  end

  it "fails if email is blank" do
    expect(described_class.count).to eq(0)
    user = described_class.new(name: "thomas",
                               username: "testerfan",
                               password: 'test')
    user.save
    expect(user.errors[:email].first).to eq "Email must not be blank"
    expect(described_class.count).to eq(0)
  end

  it "fails if name is blank" do
    expect(described_class.count).to eq(0)
    user = described_class.new(name: "",
                               email: "Dan@Test.com",
                               username: "testerfan",
                               password: 'test')
    user.save
    expect(user.errors[:name].first).to eq "Name must not be blank"
    expect(described_class.count).to eq(0)
  end
end