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

def login_user
  visit '/'
  fill_in('user', with: 'jellybean454')
  fill_in('name', with: 'Stephen Geller')
  find_button('Sign up').click
end