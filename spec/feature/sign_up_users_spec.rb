feature 'registration' do
  scenario 'a user can sign up' do
    visit '/user/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test User')
    fill_in('username', with: 'test_user')
    click_button('Submit')

    expect(page).to have_content "Welcome Test User"
  end
end
