def post_multiple_peeps
  visit('/peeps/new')
  fill_in 'peep_content', with: 'This is my first peep'
  click_button('Peep')
  sleep 0.5
  visit('/peeps/new')
  fill_in 'peep_content', with: 'This is my second peep'
  click_button('Peep')
  sleep 0.5
  visit('/peeps/new')
  fill_in 'peep_content', with: 'This is my third peep'
  click_button('Peep')
end
