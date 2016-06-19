def sign_up
  visit '/sign_up'
  fill_in 'name', with: 'John'
  fill_in 'username', with: 'John_Doe'
  fill_in 'email', with: 'john_doe@mail.com'
  fill_in 'password', with: 'secret'
  click_button 'Create my Account'
end

def post_message(comment: 'This is the best app ever!')
  visit '/post'
  fill_in 'comment', with: comment
  click_button 'Create Post!'
end

def sign_out
  visit '/sign_out'
  click_button 'Sign Out'
end
