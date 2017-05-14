def post_a_peep
  visit '/home'
  fill_in :peep, with: 'This is a peep!'
  click_button 'Peep!'
end

def post_comment
  fill_in :comment, with: 'An awesome comment!'
  click_button 'Comment'
end
