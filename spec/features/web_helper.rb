def create_peep
  visit '/peeps/new'
  fill_in 'message', with: 'Setting up Chitter. This is my first peep.'
  click_button 'Post'
end
