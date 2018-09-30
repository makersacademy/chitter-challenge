feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('name', with: 'Test Test')
    fill_in('username', with: 'Test')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Create account')

    expect(page).to have_content "Welcome to Chitter, Test"
  end
end
