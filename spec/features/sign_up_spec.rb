feature 'Signing up' do
  scenario 'A user can sign up' do
    visit '/signup'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'John Doe')
    fill_in('username', with: 'johny')
    click_button('Submit')

    expect(page).to have_content "Welcome, John Doe"
  end
end