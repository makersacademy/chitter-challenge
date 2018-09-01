def post_chits
  visit('/')
  fill_in :peep, with: 'hey!'
  click_button 'post'
  click_link 'go back'
  fill_in :peep, with: 'bye!'
  click_button 'post'
end
