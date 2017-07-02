def add_new_peep(content)
  user = User.create(email: 'mimi@gmail.com', password: 'pass123', password_confirmation: 'pass123', name: 'mimi', user_name: 'mimi the great')
  Peep.create(content: content, user_id: user.id)
  visit '/peeps/index'
end


def add_two_peeps(content1, content2)
  user = User.create(email: 'mimi@gmail.com', password: 'pass123', password_confirmation: 'pass123', name: 'mimi', user_name: 'mimi the great')
  Peep.create(content: content1, user_id: user.id)
  Peep.create(content: content2, user_id: user.id)
  visit '/peeps/index'
end


def signup_correct
  visit '/users/new'
  fill_in( 'email', with: 'john@gmail.com' )
  fill_in( 'password', with: 'pass123' )
  fill_in( 'password_confirmation', with: 'pass123' )
  fill_in( 'name', with: 'john' )
  fill_in( 'user_name', with: 'john the great' )
  click_button( 'Sign up')
end

def signup_repeat
  visit '/users/new'
  fill_in( 'email', with: 'john@gmail.com' )
  fill_in( 'password', with: 'pass123' )
  fill_in( 'password_confirmation', with: 'pass123' )
  fill_in( 'name', with: 'john' )
  fill_in( 'user_name', with: 'john the great' )
  click_button( 'Sign up')
end

def signup_incorrect
  visit '/users/new'
  fill_in( 'email', with: 'john@gmail.com' )
  fill_in( 'password', with: 'password123' )
  fill_in( 'password_confirmation', with: 'password126' )
  fill_in( 'name', with: 'john' )
  fill_in( 'user_name', with: 'john the great' )
  click_button( 'Sign up')
end
