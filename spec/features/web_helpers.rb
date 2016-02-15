module UserHelpers
  def sign_up_as(user, password_confirmation: user.password)
    visit '/users/new'
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :email, with: user.email
    fill_in :name, with: user.name
    click_button('Sign up')
  end

  def sign_in_as(user, password: user.password)
    visit '/sessions/new'
    fill_in :username, with: user.username
    fill_in :password, with: password
    click_button('Sign in')
  end
end
