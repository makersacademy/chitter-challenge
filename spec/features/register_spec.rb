feature 'register a user' do
  scenario 'a user can create an account and log in' do
    User.class_variable_set(:@@current_user, nil)
    visit '/'
    click_link('Register')
    fill_in('name', with: 'Test User 4')
    fill_in('email', with: 'test@user.four')
    fill_in('username', with: 'test_user_4')
    fill_in('password', with: 'password_4')
    click_button('Register')
    expect(page).to have_content('Hey, Test User 4!')
  end
end
