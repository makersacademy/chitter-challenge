def add_first_peep
  visit '/peeps/new'
  fill_in('peep', with: 'Hello world')
  click_button('Submit')
end

