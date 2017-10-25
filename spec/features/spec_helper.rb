def sign_up_as_mormolis
  visit('/signup')
  fill_in :first_name, with: 'George'
  fill_in :last_name, with: 'Lamprakis'
  fill_in :username, with: 'mormolis'
  fill_in :email, with: 'mormolis@example.com'
  fill_in :password, with: '121212'
  fill_in :confirmation, with: '121212'
  click_button 'Sign up'
end

def log_in_as_mormolis
  fill_in :username, with: 'mormolis'
  fill_in :password, with: '121212'
  click_button 'Log in!'
end

def peep_it
  fill_in :new_peep, with: "Just a dummy peep"
  click_button 'Peep!'
end
