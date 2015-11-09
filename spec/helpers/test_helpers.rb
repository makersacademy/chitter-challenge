module TestHelpers

  def user_sign_up(name: "David Jones",
              username: "jonesd",
              email: "user@email.com",
              password: "12345678",
              password_confirmation: "12345678")
    fill_in :name,        with: name
    fill_in :username,    with: username
    fill_in :email,       with: email
    fill_in :password,    with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button('Create Account')
  end

  def user_sign_in(email: "user@email.com",
              password: "12345678")
    fill_in :email,       with: email
    fill_in :password,    with: password
    click_button('Sign In')
  end

  def user_sign_out
    click_link('signout')
  end

  def user_post_peep(peep: "This is a peep from me")
    click_link('postp')
    fill_in :message, with: peep
    click_button('Post')
  end




end
