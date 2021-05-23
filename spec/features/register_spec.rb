feature 'Register' do
  scenario 'A user can register with an email, password, display name and handle' do
    visit '/users/new'

    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'Password1')
    fill_in('display_name', with: 'Test User')
    fill_in('username', with: 'test')
    click_button('submit')
    expect(page).to have_content('Welcome, Test User')
  end
end
