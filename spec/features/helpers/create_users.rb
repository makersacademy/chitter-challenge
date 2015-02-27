module CreateUser

  def sign_in email, password
    visit('/')
    fill_in 'Email',  :with => email
    fill_in 'Password', :with => password
    click_button 'Sign In'
  end

end