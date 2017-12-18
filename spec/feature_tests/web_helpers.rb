def peep_hello
  visit '/peep/new'
  fill_in 'peep', with: 'Hello you chitters'
  click_button 'submit'
end

def peep_christmas
  visit '/peep/new'
  fill_in 'peep', with: 'Merry Christmas'
  click_button 'submit'
end

def log_in
  visit('/users/new')
  fill_in "email_address", with: "12345@live.xyz"
  fill_in "password", with: "password"
  fill_in "password_confirmation", with: "password"
  click_button "sign up"
end

def log_in_bad
  visit('/users/new')
  fill_in "email_address", with: "12345@live.xyz"
  fill_in "password", with: "password"
  fill_in "password_confirmation", with: "password5"
  click_button "sign up"
end

def log_in_without_email
  visit('/users/new')
  fill_in "email_address", with: ""
  fill_in "password", with: "password"
  fill_in "password_confirmation", with: "password"
  click_button "sign up"
end

def log_in_with_bad_email
  visit('/users/new')
  fill_in "email_address", with: "sdhuhasdfhdsa"
  fill_in "password", with: "password"
  fill_in "password_confirmation", with: "password"
  click_button "sign up"
end

def sign_in
  visit('/users/new')
  fill_in "email_address", with: "1234@5678.com"
  fill_in "password", with: "password"
  fill_in "password_confirmation", with: "password"
  click_button "sign up"
  visit '/sessions/new'
  fill_in :email, with: "1234@5678.com"
  fill_in :password, with: "password"
  click_button 'Sign in'
end
