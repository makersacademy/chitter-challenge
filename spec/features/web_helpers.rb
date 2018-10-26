def create_single_peep
  visit('/')
  click_link('Post a Peep')
  fill_in :peep, with: 'Woohoo, I am peeping'
  click_button('Peep')
end

def create_2_peeps
  create_single_peep
  visit('/')
  click_link('Post a Peep')
  fill_in :peep, with: 'This is another peep'
  click_button('Peep')
end
