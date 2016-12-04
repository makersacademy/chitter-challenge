def sign_up
  visit '/users/new'
  fill_in('name', with: 'James Dix')
  fill_in('username', with: 'jimmygoldshine')
  fill_in('email', with: 'jamesdix@cwgsy.net')
  fill_in('password', with: 'test')
  fill_in('password_confirmation', with: 'test')
  click_button('Sign Up')
end

def password_mismatch
  visit '/users/new'
  fill_in('name', with: 'James Dix')
  fill_in('username', with: 'jimmygoldshine')
  fill_in('email', with: 'jamesdix@cwgsy.net')
  fill_in('password', with: 'test')
  fill_in('password_confirmation', with: 'tst')
  click_button('Sign Up')
end

def sign_in
  sign_up
  visit '/users'
  fill_in('username', with: 'jimmygoldshine')
  fill_in('password', with: 'test')
  click_button('Sign In')
end

def log_out
  sign_in
  click_button('Log out')
end

def incorrect_sign_in
  log_out
  fill_in('username', with: 'jimmygoldshine')
  fill_in('password', with: 'tst')
  click_button('Sign In')
end
