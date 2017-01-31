module SessionHelpers
  def user_signup
    visit '/users/new'
    fill_in(:name, with: "Jose Pedro Castanheira")
    fill_in(:username, with: "pedrocastanheira")
    fill_in(:email, with: "josepedrocastanheira@gmail.com")
    fill_in(:password, with: "1234")
    fill_in(:password_confirmation, with: "1234")
    click_button("Sign up")
  end

  def user_signin
    visit '/sessions/new'
    fill_in(:username, with: "pedrocastanheira")
    fill_in(:password, with: "1234")
    click_button("Sign in")
  end
end
