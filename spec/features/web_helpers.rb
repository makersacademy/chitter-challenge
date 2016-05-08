def complete_sign_up_form(name: 'Michael H', email: 'test@chitter.com', handle: 'mikeh91', password: 'password', confirm_password: 'password')
  visit ('/')
  click_button 'Sign Up'
  within 'form#sign_up' do
    fill_in(:name, with: name)
    fill_in(:email, with: email)
    fill_in(:handle, with: handle)
    fill_in(:pwd, with: password)
    fill_in(:pwd_confirm, with: confirm_password)
  end
end

def sign_up(name: 'Michael H', email: 'test@chitter.com', handle: 'mikeh91', password: 'password', confirm_password: 'password')
  complete_sign_up_form(name: name, email: email, handle: handle, password: password, confirm_password: confirm_password)
  click_button 'Sign Up'
end

def sign_in(email: 'test@chitter.com', password: 'password')
  visit '/'
  within 'form#sign_in_out' do
    fill_in(:email, with: email)
    fill_in(:pwd, with: password)
    click_button 'Sign in'
  end
end