feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@gmail.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Jordan')
    fill_in('username', with: 'jordanschitter')
    click_button('Sign up')

    expect(page).to have_content "Welcome to Chitter Jordan"
  end
end
