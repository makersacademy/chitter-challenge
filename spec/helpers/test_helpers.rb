module TestHelpers

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
    fill_in :user,     with: user
    fill_in :login_password, with: password
    click_button "Login"
  end

  def create_peep(text:)
    click_button "Peep"
    fill_in 'peep', with: text
    click_button 'Peep'
  end

end
