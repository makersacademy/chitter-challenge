def sign_up(username: 'User',
            email:    'user@nomail.com',
            name:     'Firstname Lastname',
            password: 's3cr3t',
            pwd_conf: 's3cr3t')
  visit '/'

  click_link 'Sign up'
  fill_in 'username', with: username
  fill_in 'email',    with: email
  fill_in 'name',     with: name
  fill_in 'password', with: password
  fill_in 'pwd_conf', with: pwd_conf
  click_button 'Submit'
end
