
feature 'signup' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Blessing')
    fill_in('username', with: 'Blessed')
    click_button('Sign Up')
    expect(page).to have_content "Welcome, Blessed"
  end
end