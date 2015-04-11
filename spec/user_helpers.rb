module User_Helpers
  def sign_up(email = 'a@a.com', password = 'baseball',
              password_confirmation = 'baseball')
    visit('/signup/')
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button('Sign Up')
  end

  def sign_in(email = 'a@a.com', password = 'baseball')
    visit('/welcome/')
    fill_in :email, with: email
    fill_in :password, with: password
    click_button('Log In')
  end

  def sign_out
    visit('/')
    click_button('Log Out')
  end
end
