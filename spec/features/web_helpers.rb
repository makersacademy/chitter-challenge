def sign_up
  visit '/users/new'
  fill_in 'name', with: "Ed Lowther"
  fill_in 'username', with: "edlowther"
  fill_in 'email', with: 'ed@geemail.com'
  fill_in 'password', with: 'very hard to guess word'
  click_button 'Create account'
end

def post_peep text
  visit '/peeps/new'
  fill_in 'peep_content', with: text
  click_button 'Send'
end 
