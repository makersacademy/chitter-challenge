
def sign_up_and_log_in
  example_user = SignUp.create(email: 'example1@fake_email.com', password: 'Password123', user_name: 'Joe Biden', handle: 'sleepy_joe')
  visit '/'
  click_on 'Log In'
  fill_in 'email', with: 'example1@fake_email.com'
  fill_in 'password', with: 'Password123'
  click_on 'Submit'
  click_on 'Home'
end

def peep_example
  fill_in 'text', with: 'I will Make America Great Again #MAGA'
  fill_in 'user_name', with: 'Donald Trump'
  fill_in 'handle', with: 'POTUS'
  click_on 'Submit'
end