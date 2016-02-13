def sign_up (name:, email:, password:, password_confirmation:)
  visit 'users/new'

  fill_in('name', with: name)
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password confirmation', with: password_confirmation)
  click_button'Sign up'
end
