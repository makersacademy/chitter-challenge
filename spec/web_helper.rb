def sign_up_one
  visit '/'
  fill_in 'name', with: 'Dave'
  fill_in 'username', with: 'Dave'
  fill_in 'email', with: 'dave@gmail.com'
  fill_in 'password', with: '1234'
  #fill_in('password_confirmation', with: '1234')
  click_button 'Sign up'
end

def sign_up_two
  visit '/'
  fill_in 'name', with: 'Dave'
  fill_in 'username', with: 'Bob'
  fill_in 'email', with: 'bob@gmail.com'
  fill_in 'password', with: '1234'
  fill_in('password_confirmation', with: '1234')
  click_button 'Sign up'
end

# def sign_up_three(name: 'alice', username: 'alice', email: 'alice@gmail.com',
#             password: '1234', password_confirmation: '1234')
#   visit '/'
#   fill_in 'name', with: name
#   fill_in 'username', with: username
#   fill_in 'email', with: email
#   fill_in 'password', with: password
#   fill_in 'password_confirmation', with: password_confirmation
#   click_button 'Sign up'
# end
