
def make_a_peep(peep)
  fill_in('peep', with: peep)
  click_on 'Submit'
end

def sign_up
  visit('/peeps')
  click_on 'Sign up'
  fill_in('email', with: ENV['MY_EMAIL'])
  fill_in('password', with: 'supersecretpassowrd')
  fill_in('name', with: 'Tom')
  fill_in('username', with: 'tomd')
  click_on 'Submit'
end

def log_in
  click_on 'Log in'
  fill_in('email', with: ENV['MY_EMAIL'])
  fill_in('password', with: 'supersecretpassowrd')
  click_on 'Submit'
end
