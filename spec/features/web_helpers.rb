def create_single_peep
  visit('/')
  click_link('Post a Peep')
  fill_in :peep, with: 'Woohoo, I am peeping'
  click_button('Peep')
end

def create_2_peeps
  create_single_peep
  visit('/')
  click_link('Post a Peep')
  fill_in :peep, with: 'This is another peep'
  click_button('Peep')
end

def register_user
  visit('/user/register')
  fill_in :firstname, with: 'Joe'
  fill_in :lastname, with: 'Bloggs'
  fill_in :username, with: 'peeper1234'
  fill_in :password, with: 'supersecretpassword'
  fill_in :email, with: 'test@test.com'
  click_button('Register')
  # p current_path
end
