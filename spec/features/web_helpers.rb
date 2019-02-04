
def make_a_peep(peep)
  fill_in('peep', with: peep)
  click_on 'Submit'
end

def sign_up(email: 'tomdamant@hotmail.com', username: 'tomd')
  visit('/peeps')
  click_on 'Sign up'
  fill_in('email', with: email)
  fill_in('password', with: 'supersecretpassowrd')
  fill_in('name', with: 'Tom')
  fill_in('username', with: username)
  click_on 'Submit'
end

def log_in
  click_on 'Log in'
  fill_in('email', with: 'tomdamant@hotmail.com')
  fill_in('password', with: 'supersecretpassowrd')
  click_on 'Submit'
end
