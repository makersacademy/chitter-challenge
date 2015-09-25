module SessionHelpers
  def sign_up(user)
      visit '/users/new'
      fill_in :email, with: user.email
      fill_in :user_name, with: user.user_name
      fill_in :password, with: user.password
      fill_in :password_confirmation, with: user.password_confirmation
      click_button 'Sign Up'
  end

  def sign_in(user)
    visit '/sessions/new'
    fill_in :email, with: user.email
    fill_in :user_name, with: user.user_name
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign Up'
  end
end