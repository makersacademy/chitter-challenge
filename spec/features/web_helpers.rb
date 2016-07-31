def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'enter_name', with: 'Mannie'
  fill_in 'username', with: 'mannieg'
  fill_in 'email', with: 'mannieg@googlemail.com'
  fill_in 'password', with: 'Password123'
  fill_in 'password_confirm', with: 'Password123'
  click_button 'Sign up'
end

def login
  user = User.new(name: 'Mannie', username: 'mannieg', password: 'test',
           password_confirm: 'test', email: 'mannieg@googlemail.com')
  user.save
  visit '/'
  click_link 'Login'
  fill_in 'username', with: 'mannieg'
  fill_in 'password', with: 'test'
  click_button 'Login'
end

def post_peep(peep = "This is a test post, Hello World!")
  click_link 'Post Peep'
  fill_in 'peep', with: peep
  click_button 'Peep'
end
