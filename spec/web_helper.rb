def post_multiple_peeps
  visit('/peeps/new')
  fill_in 'peep_content', with: 'This is my first peep'
  click_buttons
  fill_in 'peep_content', with: 'This is my second peep'
  click_buttons
  fill_in 'peep_content', with: 'This is my third peep'
  click_button('Peep')
end

def click_buttons
  click_button('Peep')
  sleep 0.5
  click_button('New Peep')
end
