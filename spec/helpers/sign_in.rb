module SignInHelpers

  def sign_in(email, password)
    visit('/')
    click_link('sign_in')
    fill_in :email, with: email
    fill_in :password, with: password
    click_button('submit_sign_in')
  end

end
