def login_in_and_peep
  User.create('Pikachu', 'mightypikachu', 'pikachu@gmail.com', '13579pikapika')
  visit('/')
  fill_in('username', with: 'mightypikachu')
  fill_in('password', with: '13579pikapika')
  click_on('Sign in')
  fill_in('message', with: 'My first peep')
  click_on('Peep')
end
