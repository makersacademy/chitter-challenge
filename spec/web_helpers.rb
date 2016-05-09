def signup
  visit '/users/new'
  fill_in 'name', with: 'Bob Bank'
  fill_in 'username', with: 'Bobby'
  fill_in 'email', with: 'test@test.com'
  fill_in 'password', with: 'abcd'
  fill_in 'password_confirmation', with: 'abcd'
  click_button 'Sign up'
end

def sign_up_bad_pw
  visit '/users/new'
  fill_in 'name', with: 'Bob Bank'
  fill_in 'username', with: 'Bobby'
  fill_in 'email', with: 'test@test.com'
  fill_in 'password', with: 'abcd'
  fill_in 'password_confirmation', with: '1234'
  click_button 'Sign up'
end

def sign_up_bad(email)
  visit '/users/new'
  fill_in 'name', with: 'Bob Bank'
  fill_in 'username', with: 'Bobby'
  fill_in 'email', with: (email)
  fill_in 'password', with: 'abcd'
  fill_in 'password_confirmation', with: 'abcd'
  click_button 'Sign up'
end

def login
  visit '/sessions/new'
  fill_in 'email', with: 'test@test.com'
  fill_in 'password', with: 'abcd'
  click_button 'Login'
end

def new_peep
  visit '/peeps/new'
  fill_in 'peep', with: 'Peep this'
  click_button 'Add Peep'
end
