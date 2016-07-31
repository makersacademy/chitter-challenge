def sign_up(name: 'example',
            username: 'example93',
            email: 'example@gmail.com',
            password: '12345',
            password_confirmation: '12345')
  visit '/users/new'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
