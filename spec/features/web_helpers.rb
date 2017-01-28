def sign_up(email: 'test@test.com',
            password: '12345678',
            password_confirmation: '12345678',
            name: 'test',
            username: 'test')

  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :name, with: name
  fill_in :username, with: username
  click_button 'Submit'
end
