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

def fill_peep_form
  fill_in 'peep_text' , with: 'test_peep_text'
  fill_in 'tags' , with: 'tag1 tag2 tag3'
end

def register_to_site
  visit '/signup'
  fill_registration_form
  click_button 'register'
end

def login_to_site
  visit '/peeps'
  fill_login_form
  click_button 'login'
end

def send_new_peep
  register_to_site
  fill_peep_form
  click_button 'peep'
end
