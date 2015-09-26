feature 'User when signing in' do

  scenario 'can sign in' do
    user = build(:user)
    visit("/")
    click_button "Sign in"
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button
  end
end