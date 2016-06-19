feature 'Logging in' do
  before do
    signup
    visit '/logout'
  end

  scenario 'User logs in with correct credentials' do
    login
    expect(page).to have_content("Hey, Bob!")
  end

  scenario 'User doesn\'t enter a username' do
    login(username: nil)
    expect(page).to have_content("Username or password incorrect.")
  end

  scenario 'User doesn\'t enter a password' do
    login(password: nil)
    expect(page).to have_content("Username or password incorrect.")
  end

  scenario 'User enters correct username but wrong password' do
    login(password: 'wrong')
    expect(page).to have_content("Username or password incorrect.")
  end

  scenario 'User enters correct password but wrong username' do
    login(username: 'wrong')
    expect(page).to have_content("Username or password incorrect.")
  end
end
