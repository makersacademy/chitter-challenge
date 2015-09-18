feature 'User sign in' do
  scenario 'with correct credentials' do
    user = create(:user)
    visit '/sessions/new'
    sign_in(user)
    expect(page).to have_content "Welcome, #{user.handle}"
  end
end
