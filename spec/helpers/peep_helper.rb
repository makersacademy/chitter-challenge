def new_peep(message: 'Makers Academy is the best')
  visit '/peep/new'
  fill_in('message', with: message)
  click_button('Post')
end
