def sign_in
  visit('/')
  within('#register') do
    fill_in('email', with: 'testing@testing.com')
    fill_in('name', with: 'Mr Squirrels')
    fill_in('password', with: '123')
  end
    click_on('Create account')
end
