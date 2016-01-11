module SessionHelpers

def login(email: 'camilla@email.com', password: 'pass123')
  visit '/login'
  fill_in("email", with: email)
  fill_in("password", with: password)
  click_button("Login")
end

def register(name: 'camilla', email: 'camilla@email.com', username: 'allimac',
              password: 'pass123', password_confirmation: 'pass123')
  visit '/register'
  fill_in("name", with: name)
  fill_in("username", with: username)
  fill_in("email", with: email)
  fill_in("password", with: password)
  fill_in("password_confirmation", with: password_confirmation)
  click_button("Register")
end

def add_peep(content: 'Some stuff in')
  click_button "Peep!"
  fill_in("content", with: content)
  click_button("Peep!")
end

end
