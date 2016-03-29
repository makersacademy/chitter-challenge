def signup(name=nil, username=nil, email=nil, password=nil, password_confirm = nil)
  visit('/user')
  fill_in(:name, with: name)
  fill_in(:username, with: username)
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  fill_in(:password_confirm, with: password_confirm)
  click_button("Sign up")
end

def signin(email=nil, password=nil)
  visit('/session/new')
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  click_button('Sign in')
end


def peep(peep=nil)
  visit('/feed/new')
  fill_in(:peep, with: peep)
  click_button('Peep now')
end