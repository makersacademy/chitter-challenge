def fill_registration_form
  fill_in 'username' , with: 'test_username'
  fill_in 'email' , with: 'test@email.com'
  fill_in 'password' , with: 'test_pwd'
  fill_in 'confirm' , with: 'test_pwd'
end

def fill_login_form
  fill_in 'username' , with: 'test_username'
  fill_in 'password' , with: 'test_pwd'
end

def register_to_site
  visit '/signup'
  fill_registration_form
  click_button 'register'
end

def login_to_site
  fill_login_form
  click_button 'login'
end
