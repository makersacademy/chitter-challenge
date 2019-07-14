feature 'Log Out' do
  scenario 'User con log out' do
    User.create(name: 'Bill Smith', username: 'bsmith', email: 'bill@smith.com', password: 'password')
    visit '/'
    expect(page).not_to have_content "Logout"

    click_button 'Log In'
    fill_in "username",     with: "bsmith"
    fill_in "password", with: "password"
    click_button "Log In"

    expect(page).to have_content "Welcome bsmith"
    click_button "Log Out"
    expect(page).not_to have_content "Welcome bsmith"
  end
end