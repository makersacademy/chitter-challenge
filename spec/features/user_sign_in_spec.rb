feature 'user sign in' do
  scenario 'with correct credentials' do
    user = create :user, email: 'ex2@example2.com', username: 'ex'
    sign_in(user)
    expect(page).to have_content "What's up, #{user.username}?"
  end
end
