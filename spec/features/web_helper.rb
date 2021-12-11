def login_in_and_peep
  visit('/')
  click_on('Login')
  fill_in('message', with: 'My first peep')
  click_on('Peep')
end
