module UserHelpers

  def sign_up_a user
    visit '/user/new'
    fill_in :name, with: user.name
    fill_in :user_name, with: user.user_name
    fill_in :email, with: user.email
    # fill_in :password, with: user.password
    # fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

end