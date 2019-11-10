def post_peep
  visit('/')
  fill_in :add_peep, with: 'hello, world'
  click_button 'Post'
end
