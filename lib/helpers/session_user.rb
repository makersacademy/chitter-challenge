module SessionUser

  def sign_up(user)
      p user
      visit '/users/new'
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_button "Sign up"
  end

  def sign_in(user)
      p user
      visit '/sessions/new'
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_button "Sign in"
  end

end