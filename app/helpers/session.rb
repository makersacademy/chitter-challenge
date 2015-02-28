module SessionHelpers

  def sign_in(username, password)
      visit '/sessions/new'
      fill_in 'username', :with => username
      fill_in 'password', :with => password
      click_button 'Sign in'
  end

  def sign_up(name = "Kev",
              username = "superkev",
              email = "kevinlanzon@gmail.com",
              password = "chitbags",
              password_confirmation = "chitbags")

    visit '/users/new'
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Join Chitter"
  end

end