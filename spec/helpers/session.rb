module SessionHelpers

  def sign_up(full_name: "maker makerson",
              user_name: "maker",
              email: "maker@example.com",
              password: "secret1234",
              password_confirmation: "secret1234"
              )
    visit '/'
    click_button('Register New User')
    fill_in :full_name,     with: full_name
    fill_in :user_name,     with: user_name
    fill_in :email,         with: email
    fill_in :password,      with: password
    fill_in :password_confirmation,  with: password_confirmation
    click_button('Sign Up')
  end

  def log_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button('Log In')
  end

  def log_out
    visit '/sessions'
    click_button('Log Out')
  end
end
