module UserHelper


  def sign_up_as(user)
    visit '/peeps'
    click_link 'join chitter'
    fill_in :email, with: user.email
    fill_in :name, with: user.name
    fill_in :user_name, with: user.user_name
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

  def sign_in_as(user)
    visit '/peeps'
    click_link'Sign in'
    fill_in :user_name, with: user.user_name
    fill_in :password, with: user.password
    click_button 'Submit'
  end

end

