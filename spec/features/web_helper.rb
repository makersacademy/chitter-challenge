def second_peep
  fill_in :peep, with: 'Second test peep'
  click_button 'Submit'
end

def create_user
  User.create(
    email: 'lol@makers.com',
    password: 'funny123',
    name: 'Joe King',
    username: 'haha88'
  )
end
