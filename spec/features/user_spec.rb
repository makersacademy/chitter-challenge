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
  scenario "tries to sign up with duplicate email" do
    expect(User.count).to eq(0)
    sign_up
    user = User.new(name: "thomas",
             email: "test@test.com",
             username: 'bad_tester',
             password: 'test')
    user.save
    expect(user.errors[:email].first).to eq "There is already a user with this email!"
    expect(User.count).to eq(1)
  end
  scenario "tries to sign up with duplicate username" do
    expect(User.count).to eq(0)
    sign_up
    user = User.new(name: "thomas",
             email: "testerfan@lovintest.com",
             username: 'super_tester',
             password: 'test')
    user.save
    expect(user.errors[:username].first).to eq "There is already a user with this username!"
    expect(User.count).to eq(1)
  end
end