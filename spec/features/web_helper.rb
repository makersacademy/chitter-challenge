def create_peep
  visit('/')
  click_button('add')

  fill_in('content', with: 'Peep!')
  click_button('submit')
end
