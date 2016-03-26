def signup(name=nil, email=nil, password=nil, password_confirm = nil)
  visit('/user')
  fill_in(:name, with: name)
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  fill_in(:password_confirm, with: password_confirm)
  click_button("Sign up")
end