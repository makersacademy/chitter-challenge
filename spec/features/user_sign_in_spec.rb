feature 'user signs in' do
  scenario 'with correct credentials' do
    user = create :user
    sign_in user
    expect(page).to have_content "Welcome, #{user.username}"
  end
end

def sign_in user
  visit '/sessions/new'
  fill_in "username", with: user.username
  fill_in "password", with: user.password
  click_on "Log in"
end