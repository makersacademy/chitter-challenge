def post_peep
  visit '/peeps/new'
  fill_in :peep_title, with: 'First peep'
  fill_in :peep_body, with: 'I love summer!'
  click_button 'Save Peep'
end
