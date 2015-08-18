module UserHelpers

  def sign_up_a user, password
    visit '/user/new'
    fill_in :name, with: user.name
    fill_in :user_name, with: user.user_name
    fill_in :email, with: user.email
    #fill_in :password, with: user.password
    fill_in :password, with: password
    click_button 'Sign up'
  end
  def sign_in_a user, password
    visit '/session/new'
    fill_in :user_name, with: user.user_name
    fill_in :password, with: password
    click_button 'Sign In'
  end

end