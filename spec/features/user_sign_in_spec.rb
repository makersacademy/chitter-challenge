feature 'user sign in' do
  scenario 'with correct credentials' do
    user = create :user, email: 'ex2@example2.com', username: 'ex'
    sign_in(user)
    expect(page).to have_content "You are logged in as #{user.username}"
  end
end
