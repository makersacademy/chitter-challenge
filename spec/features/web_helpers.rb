def make_a_peep
  visit '/peeps'
  fill_in :peep, with: 'This is a test peep!'
  click_button 'Peep it'
end
