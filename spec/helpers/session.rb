module SessionHelpers

  def log_in(username: username, password: password)
    visit '/'
    click_button('Log in')
    fill_in("username", with: username)
    fill_in("password", with: password)
    click_button("Submit")
  end

  def sign_up(
    email: "hello@gmail.com",
    password: "averystrongpassword",
    password_confirmation: "averystrongpassword",
    name: "John Johnson",
    username: "johnnyboi"
    )
    visit '/users/new'
    fill_in("email", with: email)
    fill_in("password", with: password)
    fill_in("password_confirmation", with: password_confirmation )
    fill_in("name", with: name)
    fill_in("username", with: username)
    click_button("Submit")
  end

end
