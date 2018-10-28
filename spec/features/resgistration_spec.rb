feature 'Feature - registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('first_name', with: 'Test')
    fill_in('last_name', with: 'McTest')
    fill_in('username', with: 'Testannosaurus')
    fill_in('password', with: 'password123')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, Testannosaurus"
  end
end
