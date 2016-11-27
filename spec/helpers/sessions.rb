module SessionHelpers

  def sign_in
    visit 'sessions/new'
    fill_in('email', with: "wsmith@gmail.com")
    fill_in('password', with: "123456")
    click_button('Sign in')
  end

  def sign_up(name: "Will Smith", email: "wsmith@gmail.com", user_name: "William", password: "123456", password_confirmation: "123456")
    visit '/user/new'
    fill_in('name', with: name)
    fill_in('email', with: email)
    fill_in('user_name', with: user_name)
    fill_in('password', with: password)
    fill_in('password_confirmation', with: password_confirmation)
    click_button('Sign up')
  end

  def post_message
    click_button('Post a Message')
    fill_in('title', with: "Faraway land")
    fill_in('content', with: "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.")
    click_button('Submit')
  end

end
