feature 'Log Out' do
  scenario 'User con log out' do
    User.create(name: 'Bill Smith', username: 'bsmith', email: 'bill@smith.com', password: 'password')

    visit '/'
    click_button 'Log In'
    expect(page).to have_content "Log in section"

    fill_in "user",     with: "bsmith"
    fill_in "password", with: "password"

    click_button "Log In"

    expect(page).to have_content "Welcome bsmith"

    expect(page).not_to have_content "Bill Smith"
    expect(page).to have_content "You have logged out"
  end
end