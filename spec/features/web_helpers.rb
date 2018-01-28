def add_peep(message)
  visit '/'
  click_button 'peeps'
  click_button 'Add peep'
  fill_in 'content', with: message
  click_button 'Submit'
end
