module SignIn

  def sign_in email, password
    visit 'sessions/new'
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign in"
  end

end