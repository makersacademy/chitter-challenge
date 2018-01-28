def add_peep(message)
  visit '/peeps/new'
  fill_in 'peep', with: message
  click_button 'Submit'
end

def sign_up
  visit '/signup'
  fill_in('email', :with => 'a@dotmail.com')
  fill_in('password', :with => 'password1')
  fill_in('password_confirmation', :with => 'password1')
  fill_in('name', :with => 'Alex')
  fill_in('username', :with => 'alex01')
  click_button 'Submit'
end

def bad_sign_up
  visit '/signup'
  fill_in('email', :with => 'b@dotmail.com')
  fill_in('password', :with => 'password1')
  fill_in('password_confirmation', :with => 'password2')
  fill_in('name', :with => 'Alex')
  fill_in('username', :with => 'alex01')
  click_button 'Submit'
end
