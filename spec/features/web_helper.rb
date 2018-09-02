def sign_up_one
  fill_in('name', with: 'name test')
  fill_in('user_name', with: 'user name test')
  fill_in('email', with: 'email@test')
  fill_in('password', with: 'password test')
  click_button('Submit')
end

def sign_up_two
  fill_in('name', with: 'name test two')
  fill_in('user_name', with: 'user name test two')
  fill_in('email', with: 'email@test')
  fill_in('password', with: 'password test two')
  click_button('Submit')
end

def sign_up_three
  fill_in('name', with: 'name test three')
  fill_in('user_name', with: 'user name test')
  fill_in('email', with: 'email@test three')
  fill_in('password', with: 'password test three')
  click_button('Submit')
end

def log_in_one
  click_button('LOG IN')
  fill_in('user_name', with: 'user name test')
  fill_in('password', with: 'password test')
  click_button('Submit')
end

def log_in_three
  click_button('LOG IN')
  fill_in('user_name', with: 'user name test')
  fill_in('password', with: 'password test three')
  click_button('Submit')
end

def view_and_post_peep
  click_button('VIEW PEEPS')
  click_button('POST A PEEP')
  fill_in('peep_field', with: 'peep test')
  click_button('Submit')
end
