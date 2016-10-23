module SessionHelpers


  def sign_up(name: 'Laszlo', user_name: 'laszlobogacsi', email: 'bogacsi.laszlo@gmail.com', password: 'password', password_confirmation: 'password')
    visit '/'
    click_link 'Sign up'
    fill_in('name', with: name)
    fill_in('user_name', with: user_name)
    fill_in('email', with: email)
    fill_in('password', with: password)
    fill_in('password_confirmation', with: password_confirmation)
    click_button("Sign Up!")
  end

  def log_in(user_name:, password:)
    visit '/'
    click_link 'Log in'
    fill_in('user_name', with: user_name)
    fill_in('password', with: password)
    click_button('Log in!')

  end

end
