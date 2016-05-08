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

def sign_up_log_in_peep_jane_doe
  click_button 'sign up'
  fill_in 'name', with: "jane doe"
  fill_in 'username', with: 'janedoe21'
  fill_in 'email', with: 'jdoe_lass@gmail.com'
  fill_in 'password', with: 'janedoe21'
  click_button 'submit'
  click_button 'log in'
  fill_in 'username', with: 'janedoe21'
  fill_in 'password', with: 'janedoe21'
  click_button 'submit'
  fill_in 'title', with: "Jane likes lemons"
  fill_in 'content', with: "She really does like lemons"
  click_button 'submit'
end

def wrong_log_in
  click_button 'log in'
  fill_in 'username', with: 'johnnydoe'
  fill_in 'password', with: 'jdgreat'
end

def peep
  fill_in 'title', with: "I like lemons"
  fill_in 'content', with: "I really do like lemons"
end
