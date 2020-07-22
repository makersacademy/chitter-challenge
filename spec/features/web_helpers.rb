def create_user_and_visit_sign_in
  User.create(email: 'cat@email.com', password: 'password123', name: 'Cat', username: 'catty')
  visit('/sessions/new')
end

def user_sign_in
  fill_in(:email, with: 'cat@email.com')
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end
