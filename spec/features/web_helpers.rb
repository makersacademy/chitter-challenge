def post_peep
  visit('/user')
  fill_in :add_peep, with: 'hello, world'
  click_button 'Post'
end
