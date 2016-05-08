def sign_up
  click_button 'sign up'
  fill_in 'name', with: "jon doe"
  fill_in 'username', with: 'johnnydoe21'
  fill_in 'email', with: 'jdoe_lad@gmail.com'
  fill_in 'password', with: 'jdgreatness'
end

def log_in
  click_button 'log in'
  fill_in 'username', with: 'johnnydoe21'
  fill_in 'password', with: 'jdgreatness'
end

def peep
  fill_in 'title', with: "I like lemons"
  fill_in 'content', with: "I really do like lemons"
end
