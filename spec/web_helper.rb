def signup_testuser1
  visit '/users/signup'
  fill_in 'username', with: 'testuser1'
  fill_in 'name', with: 'Test User'
  fill_in 'email', with: 'testuser1@gmail.com'
  fill_in 'password', with: 'testpassword1'
  fill_in 'password_confirmation', with: 'testpassword1'
end

def signup_testuser2
  visit '/users/signup'
  fill_in 'username', with: 'testuser2'
  fill_in 'name', with: 'Test User2'
  fill_in 'email', with: 'testuser2@gmail.com'
  fill_in 'password', with: 'testpassword2'
  fill_in 'password_confirmation', with: 'testpassword2'
end

def add_peep
  visit '/peeps/new'
  fill_in 'peep', with: "This is a testing peep #{Time::now}"
end

def signin_testuser1
  visit '/users/signin'
  fill_in 'username', with: 'testuser1'
  fill_in 'password', with: 'testpassword1'
  click_button 'Sign in'
end

def reset_sessions
  Capybara.reset_sessions!
end
