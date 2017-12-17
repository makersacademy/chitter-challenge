def submit_peep
  fill_in 'peep', with: 'testing'
  click_button 'peep'
end

def submit_peep_2
  fill_in 'peep', with: 't3sting2'
  click_button 'peep'
end

def fill_in_sign_up_form
  fill_in 'user_name', with: 'TEST'
  fill_in 'email', with: 'TEST@hotmail.com'
  fill_in 'password', with: 'testing00'
  fill_in 'confirm_password', with: 'testing00'
  click_button 'Sign up!'
end
