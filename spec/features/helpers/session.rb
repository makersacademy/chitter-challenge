module SessionHelpers

  def sign_in(username, password)
      visit '/sessions/new'
      fill_in "username", :with => username
      fill_in "password", :with => password
      click_button "Sign in"
  end

  def sign_up(name = "John Smith",
              username = "chitty1",
              email = "test@test.com",
              password = "testing",
              password_confirmation = "testing")

    visit '/users/new'
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Join Chitter"
  end

end