module SessionHelpers

  def log_in(username, password)
    visit '/sessions/new'
    fill_in("username", with: username)
    fill_in("password", with: password)
    click_button("Submit")
  end

  def sign_up
  end

end
