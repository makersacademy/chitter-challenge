feature 'Registration' do
  scenario 'a user can register' do
    visit '/users/new'
    fill_in('name', with: 'John')
    fill_in('username', with: 'john')
    fill_in('email', with: 'john@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, John"
    expect(page).to have_content "You are logged in with this email: john@example.com"
  end
end
