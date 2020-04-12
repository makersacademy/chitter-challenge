def dave_sign_up
  visit '/'
  click_on 'Sign up'
  
  fill_in('first_name', with: 'Dave')
  fill_in('last_name', with: 'Dude')
  fill_in('email', with: 'davedude@example.com')
  fill_in('user_name', with: 'davedude')
  fill_in('password', with: 'password123')

  click_on 'Submit'
end

def user_create_dave
  User.create(
    first_name: 'Dave',
    last_name: 'Dude',
    user_name: 'davedude',
    email: 'davedude@example.com', 
    password: 'password123'
  )
end