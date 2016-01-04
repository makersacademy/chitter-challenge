# As a user
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'User Log-out' do
  let(:user) do
    User.create(name: 'Joe Bloggs',
                username: 'joeb',
                email: 'joe.bloggs@gmail.com',
                password: 'jo3ble0bl3',
                password_confirmation: 'jo3ble0bl3')
  end

  scenario 'deletes session and displays goodbye message' do
    sign_in(username: user.username, password: user.password)
    click_button 'Log out'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Goodbye!'
    expect(page).to_not have_content "Welcome, #{user.name}"
  end

  scenario 'button not available if user not logged in' do
    visit '/'
    expect(page).to_not have_selector("input[type=submit][value='Log out']")
  end

end
