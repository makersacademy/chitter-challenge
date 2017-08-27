def go_to_home_page
  visit '/'
end

def go_to_login
  visit '/login'
end

def go_to_register
  visit '/register'
end

def log_in;
  go_to_login
  fill_in :username, with: 'test'
  fill_in :password, with: 'password1'
  click_button('Submit')
end

def create_account
  go_to_register
  fill_in :name, with: 'bot botterson'
  fill_in :email, with: 'bot@bot.com'
  fill_in :username, with: 'test'
  fill_in :password, with: 'password1'
  click_button('Submit')
end
