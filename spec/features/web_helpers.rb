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

def sign_in
  visit '/'
  find_button('Sign in').click
  fill_in('user', with: 'jellybean454')
  fill_in('password', with: 'password123')
  find_button('Sign up').click
end

def sign_up
  visit '/'
  find_button('Sign up').click
  fill_in('user', with: 'jellybean454')
  fill_in('name', with: 'Stephen Geller')
  fill_in('email', with: 'stephen.geller@hotmail.com')
  fill_in('password', with: 'password123')
  find_button('Sign up').click
end
