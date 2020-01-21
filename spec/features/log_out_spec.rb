feature 'Log out' do
  scenario 'A user can log out' do
    User.create(email: 'example@example.com',password: 'example123',
    name: 'Example Surname', username: 'exampleusername')
    visit '/sessions/new'
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: 'example123')
    click_button('Sign In')
    click_button('Sign Out')

    expect(page).to have_content "You have signed out"
  end
end
