def enter_chitter
  visit('/')
  click_button('see peeps')
end

def go_to_add_peep_page
  enter_chitter
  click_button('add new peep')
end
