module SessionHelpers

  def log_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log-in'
  end

  def sign_up(email: 'alice@example.com',
             username: 'alice123',
             password: '12345678',
             password_confirmation: '12345678')
   visit '/users/new'
   fill_in :email, with: email
   fill_in :username, with: username
   fill_in :password, with: password
   fill_in :password_confirmation, with: password_confirmation
   click_button 'Sign up'
  end

  # def recover_password
  #  visit '/users/recover'
  #  fill_in :email, with: "alice@example.com"
  #  click_button "Submit"
  # end
  #
  # def set_password(password:, password_confirmation:)
  #    visit("/users/reset_password?token=#{user.password_token}")
  #    fill_in :password, with: password
  #    fill_in :password_confirmation, with: password_confirmation
  #    click_button "Submit"
  # end

end
