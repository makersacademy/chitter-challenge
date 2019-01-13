def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in :email, with: 'lol@makers.com'
  fill_in :password, with: 'funny123'
  fill_in :name, with: 'Joe King'
  fill_in :username, with: 'haha88'
  click_button 'Submit'
end

def sign_in
  visit '/'
  click_link 'Sign In'
  fill_in :email, with: 'lol@makers.com'
  fill_in :password, with: 'funny123'
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

def create_first_peep
  Peep.create(
    text: 'Test peep',
    created_at: '2000-01-01 00:00:00',
    user: User.first
    )
end

def create_second_peep
  Peep.create(
    text: 'Second test peep',
    created_at: '2000-01-01 00:00:05',
    user: User.first
    )
end
