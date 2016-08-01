def sign_up(email: 'not@email.com', password_confirmation: '12345')
  visit '/users/new'
  fill_in 'name', with: 'Shadow'
  fill_in 'user_handle', with: 'Shadow1'
  fill_in 'email', with: email
  fill_in 'password', with: '12345'
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit 'sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def post_a_comment(comment:)
  visit '/peeps/new'
  fill_in 'comment', with: comment
  click_button 'Comment'
end
