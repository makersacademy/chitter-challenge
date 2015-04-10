require_relative '../../app/models/user'
feature 'user signs up' do
  scenario "adds a user to the database" do
    expect(User.count).to eq(0)
    User.create(name: "dan",
                email: "test@test.com",
                username: 'super_tester',
                password: 'test'
      )
    expect(User.count).to eq(1)
  end
end