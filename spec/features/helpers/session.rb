module SessionHelpers

  def sign_in(username, password)
    visit '/sessions/new'
    fill_in 'username', :with => username
    fill_in 'password', :with => password
    click_button "Sign in"
  end

  def sign_up(name = "Loris Fochesato",
              username = "Lorisfo",
              email = "loris@example.com",
              password = "Ruby!",
              password_confirmation = "Ruby!")
    visit '/makers/new'
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

end