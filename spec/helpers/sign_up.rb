module SignUpHelpers

  def sign_up(name, email, user_name, password, password_conf)
    visit('/')
    click_link('sign_up')
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :user_name, with: user_name
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_conf
    click_button('submit_sign_up')
  end

end
