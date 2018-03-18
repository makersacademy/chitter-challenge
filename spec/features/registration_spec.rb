feature 'registration' do
  scenario 'a user can sign up' do
    visit '/signup'
    fill_in('input_email', with: 'test@test.com')
    fill_in('input_password', with: 'test')
    fill_in('input_username', with: 'password123')
    fill_in('input_firstname', with: 'testy')
    fill_in('input_lastname', with: 'mctesty')

    click_button('Register')

    expect(page).to have_content "Welcome, test@example.com"
  end
end
