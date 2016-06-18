def sign_up(name: 'Toby Wilkins',
            email: 'tobywilkinsuk@hotmail.com',
            password: 'password',
            password_confirmation: 'password',
            username: 'Tobes')
  visit '/register'
  fill_in('name', with: name)
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  fill_in('username', with: username)
  click_button('register')
end
