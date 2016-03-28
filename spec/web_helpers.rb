def register(email: "roxy@cat.com" ,
             username: "roxy_cat",
             realname: "Roxy",
             password: "12345678",
             pw_confirm: "12345678")
  visit '/users/new'
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :realname, with: realname
  fill_in :password, with: password
  fill_in :pw_confirm, with: pw_confirm
  click_button("Register")
end

def sign_in(email: , password: )
  visit '/sessions/new'
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  click_button("Sign in")
end
