def sign_up(user_name: 'jinis',
            email: 'jinis@aol.jp',
            password: 'jinis1219',
            password_confirmation: 'jinis1219')
  visit('/')
  fill_in('user_name', with: user_name)
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('Sign up')
end
