def sign_in_and_play
  visit('/peeps/new')
  fill_in :message, with: 'This is a test'
  click_button 'Submit'
end
