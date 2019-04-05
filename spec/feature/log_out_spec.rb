feature 'Log out' do
  scenario 'User can log out' do
    User.create(name: 'Test', username: 'some_name', email: 'dsadsa@google.com', password: '123456789')

    visit '/'
    click_button 'login'
    expect(page).to have_content "Log in"

    fill_in "user",	with: "some_name" 
    fill_in "pass",	with: "123456789"

    click_button "Log in"

    expect(page).to have_content "Welcome some_name"

    click_button "Log out"

    expect(page).not_to have_content "some_name"
    expect(page).to have_content "You have logged out."
  end
end
