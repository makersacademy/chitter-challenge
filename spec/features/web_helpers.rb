def sign_in_and_enter
  visit('/')
  fill_in :username, with: 'Daniel'
  click_button 'Start Chitter!'
end
