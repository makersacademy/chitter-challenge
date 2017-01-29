def sign_up(username: 'Gus', email: 'test@test.com')
  visit '/'
  click_link 'Sign up'
  fill_in 'enter_name', with: 'Gus'
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: 'Password123'
  fill_in 'password_confirm', with: 'Password123'
  click_button 'Sign up'
end

def login
  user = User.new(name: 'Gurminder', username: 'Gus', password: 'test',
           password_confirm: 'test', email: 'test@test.com')
  user.save
  visit '/'
  click_link 'Login'
  fill_in 'username', with: 'Gus'
  fill_in 'password', with: 'test'
  click_button 'Login'
end

def post_peep(peep = "This is a test post, Hello World!")
  click_link 'Post Peep'
  fill_in 'peep', with: peep
  click_button 'Peep'
end
