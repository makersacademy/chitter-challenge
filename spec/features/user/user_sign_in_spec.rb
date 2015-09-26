feature 'User when signing in' do

  scenario 'can sign in' do
    user = build(:user)
    visit("/")
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button "Sign in"
    expect(page).to have_content "Welcome! #{user.username}!"
  end
end