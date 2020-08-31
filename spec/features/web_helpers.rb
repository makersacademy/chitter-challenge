def create_peep(message)
  visit '/create_peep'
  fill_in 'peep', with: message
  click_button 'Post'
end
  
