def make_peep(peep)
  visit('/')
  fill_in('peep', with: "#{peep}")
  click_button('Peep')
end

def sign_up
  visit '/'
  click_button('Sign Up')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  fill_in('username', with: 'testusername')
  fill_in('name', with: 'testname')
  click_button('Submit')
end
