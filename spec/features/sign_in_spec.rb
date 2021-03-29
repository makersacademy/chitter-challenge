feature 'Sign in' do
  scenario 'User logs in with their username and password' do
    visit('/')
    fill_in "username", with: "taran314"
    fill_in "password", with: "taranisthebest"
    click_button "Sign in"
    expect(page).to have_content "Welcome back to Chitter taran314!"
  end
  scenario 'User inputs invalid username or password' do
    visit('/')
    fill_in "username", with: "wrong"
    fill_in "password", with: "login"
    click_button "Sign in"
    expect(page).to have_content "Welcome to Chitter!"
    expect(page).to have_content "Your username or password was not recognised, try again"
  end
end
