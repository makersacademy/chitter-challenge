

def sign_up(email: email,
            name: name,
            username: username,
            password: password,
            password_confirmation: password_confirmation)

  visit '/sign_up'
  fill_in('email', with: email)
  fill_in('username', with: username)
  fill_in('name', with: name)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('Sign up')
end
