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
