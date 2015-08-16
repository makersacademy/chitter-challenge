module TestHelpers
  def sign_in user
    visit '/sessions/new'
    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_on "Log in"
  end

  def sign_up(user)
    visit '/users/new'
    fill_in "username", with: user.username
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    fill_in "password_confirmation", with: user.password_confirmation
    click_on "Sign Up"
  end

  def make_new_peep user, peep
    sign_in(user)
    visit '/peeps/new'
    fill_in "content", with: peep
    click_on "Peep it"
  end
end