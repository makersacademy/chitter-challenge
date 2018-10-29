feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('name', with: 'Mr Test')
    fill_in('username', with: 'test_test')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, test@example.com"
  end
end
