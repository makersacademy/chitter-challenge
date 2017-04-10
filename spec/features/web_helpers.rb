def sign_up
  visit('/user/new')
  fill_in("username", with: "Magnus")
  fill_in("email", with: "mail@magnusholm.com")
  fill_in("password", with: "123banana")
  fill_in("password_confirmation", with: "123banana")
  click_button('Sign up')
end

def sign_in(username:, password:)
  visit('/sessions/new')
  fill_in(:username, with: "Magnus")
  fill_in(:password, with: "123banana" )
  click_button("Sign in")
end
