feature "Sign out" do
  scenario "user can sign out" do
    User.create(email: 'test@example.com', password: 'password123', name:'Kitty', username:'HelloKitty')
    visit '/'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_on 'Log In'
    click_on 'Sign Out'
    expect(page).to have_content "Goodbye!"
  end
end