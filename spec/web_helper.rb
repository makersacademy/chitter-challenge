def add_new_peep
  visit '/peeps/index'
  fill_in('content', with: 'Happy it\'s saturday')
  click_button('Peep')
end

def add_another_peep
  visit '/peeps/index'
  fill_in('content', with: 'it\'s already sunday :( ...')
  click_button('Peep')
end
