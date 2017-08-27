def new_peep
  visit '/new'
  fill_in('new_peep', with: 'First peep!')
  find_button('Submit').click
end

def other_peep
  visit '/new'
  fill_in('new_peep', with: 'Second peep!')
  find_button('Submit').click
end
