module SessionHelpers

  def sign_up(email: 'tommy@test.com', username: "tommytest", password: 'qwerty', password_confirmation: 'qwerty')
    visit 'users/new'
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Start Pooping'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign In'
  end

end
