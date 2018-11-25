Module Helpers

def user_sign_in
  visit('/sessions/new')
  fill_in 'name', with: 'Sam'
  fill_in 'email', with: 'sam@example.com'
  fill_in 'password', with: 'password123'
  click_button "Sign in"
end

def post_a_peep
  visit('/peeps/new')
  fill_in('message', with: 'Some peep message')
  click_button('Submit')
end
