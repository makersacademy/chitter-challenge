feature 'user log in' do
  scenario 'a user can log in' do
    visit '/'
    click_link('Log In')
    fill_in('username', with: 'test_user_1')
    fill_in('password', with: 'password_1')
    click_button('Log In')
    expect(page).to have_content('Hey, Test User 1!')
  end
end
