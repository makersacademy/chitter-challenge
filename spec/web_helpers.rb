def visit_homepage_fill_in_peeps
  visit('/')
  fill_in 'text', with: 'Otters are cute'
  click_button 'Peep'
  fill_in 'text', with: 'But Squirrels are better'
  click_button 'Peep'
  fill_in 'text', with: 'Yo wadddup'
  click_button 'Peep'
end