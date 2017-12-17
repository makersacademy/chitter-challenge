def sign_up
  visit '/users/new'
  fill_in :email, with: 'yan@example.com'
  fill_in :name, with: 'Yan'
  fill_in :username, with: 'yanny'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'password'
  click_button "Sign up"
end

def sign_up_badly
  visit '/users/new'
  fill_in :email, with: 'yan@example.com'
  fill_in :name, with: 'Yan'
  fill_in :username, with: 'yanny'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'incorrect'
  click_button "Sign up"
end

def post_a_peep(message)
  visit '/peeps/new'
  Peep.create(user_id: User.first.id, message: message)
  click_button 'Post'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
