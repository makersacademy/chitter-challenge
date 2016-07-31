module SessionHelpers

  def sign_up(name: "John Smith",
              email: "john.smith@example.com",
              username: "jsmith",
              password: '12345',
              password_confirmation: '12345')
    visit '/users/new'
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button('Sign up')
  end

  def sign_in(username:,password:)
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button("Sign in")
  end

end
