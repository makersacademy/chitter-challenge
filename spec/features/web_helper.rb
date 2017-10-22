def create_new_peep
  visit('/peeps/new')
  fill_in :text, with: 'Test peep'
  click_button 'Submit'
end
