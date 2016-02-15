def sign_up
  visit '/users/new_user'
  fill_in 'name',   with: 'Rachel'
  fill_in 'username',   with: 'User 1'
  fill_in 'email',   with: 'Rachel@email.com'
  fill_in 'password', with: 'Pa55w0rd'
  fill_in 'password_confirmation', with: 'Pa55w0rd'
  click_button 'Sign up'
end

def sign_up_dup_username
  visit '/users/new_user'
  fill_in 'name',   with: 'Smith'
  fill_in 'username',   with: 'User 1'
  fill_in 'email',   with: 'Smith@email.com'
  fill_in 'password', with: 'Cat8'
  fill_in 'password_confirmation', with: 'Cat8'
  click_button 'Sign up'
end

def sign_up_dup_email
  visit '/users/new_user'
  fill_in 'name',   with: 'Smith'
  fill_in 'username',   with: 'User 2'
  fill_in 'email',   with: 'Rachel@email.com'
  fill_in 'password', with: 'Cat8'
  fill_in 'password_confirmation', with: 'Cat8'
  click_button 'Sign up'
end

def sign_up_pw_not_matching
  visit '/users/new_user'
  fill_in 'name',   with: 'Rachel'
  fill_in 'username',   with: 'User 1'
  fill_in 'email',   with: 'Rachel@email.com'
  fill_in 'password', with: 'Pa55w0rd'
  fill_in 'password_confirmation', with: 'Cat8'
  click_button 'Sign up'
end

def sign_in
  visit '/sessions/sign_in'
  fill_in 'name',   with: 'Rachel'
  fill_in 'username',   with: 'User 1'
  fill_in 'email',   with: 'Rachel@email.com'
  fill_in 'password', with: 'Pa55w0rd'
  click_button 'Sign in!'
end

def sign_out
  visit '/'

end

def create_peep(message, title)
  Peep.create(message: message, title: title)
end

def sign_in_wrong_name
  visit '/sessions/sign_in'
  fill_in 'name',   with: 'Wrong'
  fill_in 'username',   with: 'User 1'
  fill_in 'email',   with: 'Rachel@email.com'
  fill_in 'password', with: 'Pa55w0rd'
  click_button 'Sign in!'
end

def sign_in_wrong_usernname
  visit '/sessions/sign_in'
  fill_in 'name',   with: 'Rachel'
  fill_in 'username',   with: 'wrong'
  fill_in 'email',   with: 'Rachel@email.com'
  fill_in 'password', with: 'Pa55w0rd'
  click_button 'Sign in!'
end

def sign_in_wrong_email
  visit '/sessions/sign_in'
  fill_in 'name',   with: 'Rachel'
  fill_in 'username',   with: 'User 1'
  fill_in 'email',   with: 'Wrong'
  fill_in 'password', with: 'Pa55w0rd'
  click_button 'Sign in!'
end

def sign_in_wrong_pw
  visit '/sessions/sign_in'
  fill_in 'name',   with: 'Wrong'
  fill_in 'username',   with: 'User 1'
  fill_in 'email',   with: 'Rachel@email.com'
  fill_in 'password', with: 'Wrong'
  click_button 'Sign in!'
end
