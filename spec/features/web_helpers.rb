def complete_sign_up_form(name: 'Michael H', email: 'test@chitter.com', handle: 'mikeh91', password: 'password', confirm_password: 'password')
  visit ('/')
  click_button 'Sign Up'
  fill_in(:name, with: name)
  fill_in(:email, with: email)
  fill_in(:handle, with: handle)
  fill_in(:pwd, with: password)
  fill_in(:pwd_confirm, with: confirm_password)
end

def sign_up(name: 'Michael H', email: 'test@chitter.com', handle: 'mikeh91', password: 'password', confirm_password: 'password')
  complete_sign_up_form(name: name, email: email, handle: handle, password: password, confirm_password: confirm_password)
  click_button 'Sign Up'
end