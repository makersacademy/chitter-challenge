def login_in_and_peep
  visit('/')
  fill_in('username', with: 'Pikachu')
  click_on('Sign in')
  fill_in('message', with: 'My first peep')
  click_on('Peep')
end
