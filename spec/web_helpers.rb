def sign_up_new
  visit('/')
  fill_in 'email', with: 'freddy@hotmail.com'
  fill_in 'password', with: 'freddy'
  click_button 'Sign up'
end

def sign_up_bad_format
  visit('/')
  fill_in 'email', with: 'freddyhotmail.com'
  fill_in 'password', with: 'freddy'
  click_button 'Sign up'
end

def sign_in_correct
  visit('/')
  fill_in 'email', with: 'tom@hotmail.com'
  fill_in 'password', with: 'tom'
  click_button 'Login'
end

def sign_in_incorrect
  visit('/')
  fill_in 'email', with: 'tom@hotmail.com'
  fill_in 'password', with: 'bom'
  click_button 'Login'
end

def sign_up_existing
  visit('/')
  fill_in 'email', with: 'tom@hotmail.com'
  fill_in 'password', with: 'tom'
  click_button 'Sign up'
end
