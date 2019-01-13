def post_peep
  visit '/'
  fill_in :peep, with: 'Writing a peep'
  click_button 'Submit your peep'
end
