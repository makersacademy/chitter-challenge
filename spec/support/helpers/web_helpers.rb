module WebHelpers
  def sign_up(username: 'User',
              email: 'user@nomail.com',
              name: 'Firstname Lastname',
              password: 's3cr3t',
              password_confirmation: 's3cr3t')
    visit '/'

    click_link 'Sign up'
    fill_in 'username', with: username
    fill_in 'email',    with: email
    fill_in 'name',     with: name
    fill_in 'password', with: password
    fill_in 'pwd_conf', with: password_confirmation
    click_button 'Submit'
  end

  def log_in( email: 'user@nomail.com',
              password: 's3cr3t')
    visit '/'

    click_link 'Log in'
    fill_in 'email',    with: email
    fill_in 'password', with: password
    click_button 'Submit'
  end

  def log_out
    visit '/'

    click_button 'Log out'
  end
end
