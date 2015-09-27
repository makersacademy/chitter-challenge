module SessionUser

  def sign_up(user)
    visit '/'
    fill_in 'email',    with: user.email
    fill_in 'password', with: user.password
    fill_in 'name',     with: user.name
    fill_in 'username', with: user.username
    click_button "Sign up"
  end

  def sign_in(user:, password:)
    visit '/'
    fill_in :user,     with: 'james_bond'
    fill_in :login_password, with: 'agent007'
    click_button "Login"
  end

end
