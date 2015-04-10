require_relative '../../app/models/user'
feature 'user signs up' do

  def sign_up
    User.create(name: "dan",
                email: "test@test.com",
                username: 'super_tester',
                password: 'test'
      )
  end

  scenario "adds a user to the database" do
    expect(User.count).to eq(0)
    sign_up
    expect(User.count).to eq(1)
  end
  scenario "users password is kept securely" do
    sign_up
    expect(User.first.password_digest).not_to eq('test')
  end
end