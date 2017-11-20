def create_user_and_post_peeps
  user = User.create(name: 'example', email: 'example',
    username:'Olegfkl', password: 'example', password_confirmation: 'example')
  Peep.create(maker: user.username, body: 'first', user_id:  user.id)
  Peep.create(maker: user.username, body: 'second', user_id: user.id)
end

def sign_up
  visit('/signup')
  fill_in('name', with: 'Oleg Gru')
  fill_in('username', with: 'Olegfkl')
  fill_in('email', with: 'example@example.com')
  fill_in('password', with: 'password123')
  fill_in('password_confirmation', with: 'password123')
  click_button 'Submit'
end

def sign_up_mismatch
  visit('/signup')
  fill_in('name', with: 'Oleg Gru')
  fill_in('username', with: 'Olegfkl')
  fill_in('email', with: 'example@example.com')
  fill_in('password', with: 'password123')
  fill_in('password_confirmation', with: 'password')
  click_button 'Submit'
end

def post_a_peep
  visit('/peeps')
  fill_in('new_peep', with: 'Hello World')
end
