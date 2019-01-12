def second_peep
  fill_in :peep, with: 'Second test peep'
  click_button 'Submit'
end

def sign_up
  isit '/'
  click_link 'Sign Up'
  fill_in :email, with: 'lol@makers.com'
  fill_in :password, with: 'funny123'
  fill_in :name, with: 'Joe King'
  fill_in :username, with: 'haha88'
  click_button 'Submit'
end
