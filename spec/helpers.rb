

def sign_up
  visit "/users/new"
  fill_in('name', :with => 'James')
  fill_in('email', :with => 'james@hello.com')
  fill_in('username', :with => 'jamesman')
  fill_in('password', :with => 'qwerty1234')
  fill_in('password_confirmation', :with => 'qwerty1234')

  click_button("Sign up!")
end
