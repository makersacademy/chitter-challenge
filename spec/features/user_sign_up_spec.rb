feature 'User sign up' do
  scenario 'with correct credentials' do

    # here I had to change the unique attributes of the user of the test would fail because of the other use generated in other scenarios. Is there a way to clean the database after each scenario is tested?
    user = build(:user, email: 'example@example.com', username: 'other')
    sign_up(user)
    expect(page).to have_content("You are logged in as #{user.username}")
  end
end
