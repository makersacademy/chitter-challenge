def signup_helper
  name = 'Bob Geldof'
  username = 'begeldof'
  email = 'its.me@bobgeldof.com'
  password = 'bob123'

  visit('/users/new')
  fill_in('name', with: name)
  fill_in('username', with: username)
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Submit')
end
