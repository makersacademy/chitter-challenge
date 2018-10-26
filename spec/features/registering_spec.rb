feature 'registering' do
  scenario 'passwords dont match' do
    visit '/'
    click_button 'Register'
    fill_in('Name', with: "John")
    fill_in('Username', with: "Jonny101")
    fill_in('Password', with: 'password')
    fill_in('Confirm_Password', with: 'notpassword')
    fill_in('Email', with: 'my@email.com')
    click_button 'Submit'
    expect(page).to have_content "Passwords don't match."
  end
  scenario 'passwords dont match' do
    visit '/'
    create_account("Jonny101")
    click_button("Logout")
    create_account("Jonny101")
    expect(page).to have_content "Username or email already taken"
  end
end
