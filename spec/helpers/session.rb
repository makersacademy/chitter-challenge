module SessionHelpers

  def sign_up_as(user)
    visit '/users/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :name, with: user.name
    fill_in :user_name, with: user.user_name
    click_button 'Sign up'
  end

end