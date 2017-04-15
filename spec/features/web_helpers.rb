def sign_up
  visit('/user/new')
  fill_in("username", with: "Magnus")
  fill_in("name", with: "Magnus Holm")
  fill_in("email", with: "mail@magnusholm.com")
  fill_in("password", with: "123banana")
  fill_in("password_confirmation", with: "123banana")
  click_button('Sign up')
end

def log_in(username:, password:)
  visit('/peeps/index')
  fill_in(:username, with: "Magnus")
  fill_in(:password, with: "123banana" )
  click_button("Log in")
end
