def post(text)
  User.create(
    name:                   'Test User Name',
    email:                  'test@test.com',
    password:               'qwerty',
    password_confirmation:  'qwerty')
  log_in_existing_user
  fill_in 'peep', with: text
  click_button 'post'
end
