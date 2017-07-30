module Helpers
  def post_peep(message = "Hello")
    visit '/peeps/new'
    fill_in 'message', with: message
    click_button 'Peep!'
  end

  def sign_up(username: "user123", email: "email@email.com", password: "123", password_confirmation: "123")
    visit '/users/new'
    fill_in 'username', with: username
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirm', with: password_confirmation
    click_button 'Sign me up!'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
