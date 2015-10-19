module Helpers

  def sign_up_as(user)
    visit '/users/new'
    fill_in :name,     with: user.name
    fill_in :email,    with: user.email
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    # click_button 'Sign up'
  end

  def sign_in_as(user)
    visit '/'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
  end
  
end