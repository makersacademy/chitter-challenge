def sign_in_and_play
  visit('/peeps/new')
  fill_in :peep, with: 'This is a test peep'
  click_button 'Submit'
end
