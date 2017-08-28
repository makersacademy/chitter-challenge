def go_to_home_page
  visit '/'
end

def go_to_login
  visit '/login'
end

def go_to_register
  visit '/register'
end

def log_in(name = 'test')
  go_to_login
  fill_in :username, with: name
  fill_in :password, with: 'password1'
  click_button('Submit')
end

def log_out
  click_button('log out')
end

def create_account(
  username = 'test',
  password = 'password1',
  email = 'bot@bot.com',
  name = 'bot botterson'
)
  go_to_register
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :username, with: username
  fill_in :password, with: password
  click_button('Submit')
end

def new_post(title = '1337 test post', body = 'this is a 1337 test')
  go_to_home_page
  fill_in :title, with: title
  fill_in :body, with: body
  click_button('Submit')
end
