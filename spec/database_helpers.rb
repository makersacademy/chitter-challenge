def sign_up
  visit('/signup')

  fill_in('name', with: 'Test User')
  fill_in('username', with: 'TestUser')
  fill_in('email', with: 'test@ing.com')
  fill_in('password', with: 'password')
  click_on 'Submit'
end

def sign_in
  visit('/chitter')

  fill_in('username', with: 'TestUser')
  fill_in('password', with: 'password')
  click_on 'Submit'
end
