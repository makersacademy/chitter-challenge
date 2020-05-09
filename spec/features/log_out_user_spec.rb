feature 'Log out User' do
  scenario 'Logs out current user' do
    user = User.create(name: "Gareth", email: "gareth@gmail.com", password: '12345')

    visit('users/login')

    fill_in('email', with: 'gareth@gmail.com')
    fill_in('password', with: '12345')
    click_button('Login')

    click_link('Log out')
    expect(page).to have_link("Log in")
  end
end
