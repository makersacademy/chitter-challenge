def fill_db
  visit('/')
  fill_in 'new_peep', with: 'This is my first peep'
  click_button('Peep')
  fill_in 'new_peep', with: 'tis but a peep'
  click_button('Peep')
  fill_in 'new_peep', with: 'no body expects the spanish inquisition'
  click_button('Peep')
end