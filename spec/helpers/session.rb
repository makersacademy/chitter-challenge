module SessionHelpers

  def sign_up(password = 's3cr3t!')
    visit '/'
    click_button 'Sign up'
    fill_in :name, with: 'Nick'
    fill_in :user_name, with: 'nmrichards'
    fill_in :email, with: 'batman@gmail.com'
    fill_in :password, with: password
    fill_in :password_confirmation, with: 's3cr3t!'
    click_button 'Sign up'
  end

  def no_email
    visit '/'
    click_button 'Sign up'
    fill_in :name, with: 'Nick'
    fill_in :user_name, with: 'nmrichards'
    fill_in :email, with: ''
    fill_in :password, with: 's3cr3t!'
    fill_in :password_confirmation, with: 's3cr3t!'
    click_button 'Sign up'
  end

  def invalid_email
    visit '/'
    click_button 'Sign up'
    fill_in :name, with: 'Nick'
    fill_in :user_name, with: 'nmrichards'
    fill_in :email, with: 'batman'
    fill_in :password, with: 's3cr3t!'
    fill_in :password_confirmation, with: 's3cr3t!'
    click_button 'Sign up'
  end

  def sign_in
    sign_up
    visit '/'
    click_button 'Sign in'
    fill_in :user_name, with: 'nmrichards'
    fill_in :password, with: 'password'
    click_button 'Sign in'
  end


end
