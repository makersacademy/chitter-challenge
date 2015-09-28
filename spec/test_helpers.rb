module TestHelpers

  def send_a_peep(peep)
    visit '/'
    fill_in :message, with: peep.message
    click_button 'Peep'
  end

  def sign_up_as(user)
    visit '/'
    click_button 'Sign up'
    fill_in :name, with: user.name
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :handle, with: user.handle
    click_button 'Sign up'
  end

  def log_in_as(user)
    visit '/'
    click_button 'Log in'
    fill_in :handle, with: user.handle
    fill_in :password, with: user.password
    click_button 'Log in'
  end

end
