def post_chits
  visit('/')
  fill_in :chit, with: 'hey!'
  click_button 'post'
  click_link 'go back'
  fill_in :chit, with: 'bye!'
  click_button 'post'
end
