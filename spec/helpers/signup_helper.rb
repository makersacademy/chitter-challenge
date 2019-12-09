def sign_up name, email, username: nil, password: "test1Password"
  visit '/'

  click_on 'Sign up'

  fill_in 'name', with: name
  fill_in 'username', with: (username || name.gsub(' ', ''))
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Sign up'
end
