def sign_up
  visit('/')
  click_button('sign up')
  fill_in :name, with: 'tester'
  fill_in :email, with: 'email@email.com'
  fill_in :password, with: 'test123'
  click_button('submit')
end

def login
  visit('/')
  click_button('login')
  fill_in :email, with: 'email@email.com'
  fill_in :password, with: 'test123'
  click_button('submit')
end
