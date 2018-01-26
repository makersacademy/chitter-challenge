module Helpers

  def sign_up
    visit('/register/signup')
    fill_in :email, with: 'cleo@email.com'
    fill_in :password, with: 'password1'
    click_button "sign-up"
  end

end
