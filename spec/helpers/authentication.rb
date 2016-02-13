module Authentication
  def signup(name: "Alex", email: "a@a.com", username: "xela", password: "123", password_confirmation: "123")
    visit('/users/signup')
    fill_in('name', with: name)
    fill_in('email', with: email)
    fill_in('username', with: username)
    fill_in('password', with: password)
    fill_in('password_confirmation', with: password_confirmation)
    click_button("Sign Up")
  end

  def login(email: "a@a.com", password: "123")
    visit('/users/login')
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button("Login")
  end

  def logout
    click_button('Logout')
  end

end
