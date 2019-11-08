def log_in
  visit '/login'
  fill_in :username, with: 'capybara'
  fill_in :password, with: 'capybara'
  click_on('Log in')
end

def register(value = 'capybara')
  visit '/register'
  fill_in :username, with: value
  fill_in :password, with: value
  fill_in :email, with: "#{value}@example.com"
  fill_in :name, with: "#{value} Test"
  click_on('Register')
end
