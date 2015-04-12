require_relative '../../app/models/user'
feature 'user signs up' do

  def sign_up
    User.create(name: "dan",
                email: "test@test.com",
                username: 'super_tester',
                password: 'test'
      )
  end

  scenario "signs up, adds a user to the database" do
    expect(User.count).to eq(0)
    sign_up
    expect(User.count).to eq(1)
  end
  scenario "users password is kept securely" do
    sign_up
    expect(User.first.password_digest).not_to eq('test')
  end
  scenario "fails with duplicate email" do
    expect(User.count).to eq(0)
    sign_up
    user = User.new(name: "thomas",
                    email: "test@test.com",
                    username: 'bad_tester',
                    password: 'test')
    user.save
    expect(user.errors[:email].first).to eq "Email is already taken"
    expect(User.count).to eq(1)
  end
  scenario "fails with duplicate username" do
    expect(User.count).to eq(0)
    sign_up
    user = User.new(name: "thomas",
             email: "testerfan@lovintest.com",
             username: 'super_tester',
             password: 'test')
    user.save
    expect(user.errors[:username].first).to eq "Username is already taken"
    expect(User.count).to eq(1)
  end

  scenario "fails if username is blank" do
    expect(User.count).to eq(0)
    user = User.new(name: "thomas",
                    email: "testerfan@lovintest.com",
                    password: 'test')
    user.save
    expect(user.errors[:username].first).to eq "Username must not be blank"
    expect(User.count).to eq(0)
  end

  scenario "fails if email is blank" do
    expect(User.count).to eq(0)
    user = User.new(name: "thomas",
                    username: "testerfan",
                    password: 'test')
    user.save
    expect(user.errors[:email].first).to eq "Email must not be blank"
    expect(User.count).to eq(0)
  end

  scenario "fails if name is blank" do
    expect(User.count).to eq(0)
    user = User.new(name: "",
                    email: "Dan@Test.com",
                    username: "testerfan",
                    password: 'test')
    user.save
    expect(user.errors[:name].first).to eq "Name must not be blank"
    expect(User.count).to eq(0)
  end
end