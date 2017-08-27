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

def create_account(name = 'test')
  go_to_register
  fill_in :name, with: 'bot botterson'
  fill_in :email, with: 'bot@bot.com'
  fill_in :username, with: name
  fill_in :password, with: 'password1'
  click_button('Submit')
end

def new_post(title = '1337 test post')
  go_to_home_page
  fill_in :title, with: title
  fill_in :body, with: 'this is a 1337 test'
  click_button('Submit')
end
