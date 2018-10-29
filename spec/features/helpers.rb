module Helpers

  def sign_in(user)
    visit('/sessions/new')
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in"
  end
end
