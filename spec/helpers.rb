module Helpers

  def sign_in(user)
    visit '/peeps'
    click_button('Sign in')
    fill_in(:email, with: user.email)
    fill_in(:password, with: user.password)
    click_button('Sign in')
  end
end
