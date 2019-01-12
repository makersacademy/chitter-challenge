def post_peep
  visit '/'
  fill_in :peep, with: 'Test peep'
  click_button 'Submit'
end
