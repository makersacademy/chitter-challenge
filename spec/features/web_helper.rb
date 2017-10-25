def create_new_peep(text = 'Test peep')
  visit('/peeps/new')
  fill_in :text, with: text
  click_button 'Submit'
end
