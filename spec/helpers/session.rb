module SessionHelpers

  def sign_up(user)
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :username, with: password_confirmation
    click_button 'Sign up'
  end

end