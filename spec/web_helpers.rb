def add_cheep(post)
  visit 'user/sign_up'
  fill_in 'username', with: 'test_user'
  fill_in 'password', with: 'test_password'
  fill_in 'email', with: 'test_email'
  fill_in 'name', with: 'test_name'
  click_button 'Submit'
  fill_in 'content', with: post
  click_button 'Post'
end

def sign_in(username, password)
  visit '/'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Submit'
end

def sign_up(name:, email:, username:, password:)
  visit '/sign_up'
  fill_in 'username', with: username
  fill_in 'password', with: password
  fill_in 'email', with: email
  fill_in 'name', with: name
  click_button 'Submit'
end

def sign_up_anon
  visit 'user/sign_up'
  fill_in 'username', with: 'test_user'
  fill_in 'password', with: 'test_password'
  fill_in 'email', with: 'test_email'
  fill_in 'name', with: 'test_name'
  click_button 'Submit'
end
