def post_first_peep
  visit '/' 
  fill_in :peep_content, with: 'My first peep'
  click_button 'Post'
end
