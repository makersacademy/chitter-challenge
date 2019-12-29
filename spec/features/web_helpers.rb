def sign_up
  visit('/')
  click_on ('sign-up')
  fill_in 'first-name', with: 'User1'
  fill_in 'surname', with: 'One'
  fill_in 'new-email', with: 'user1@test.com'
  fill_in 'new-grip', with: 'user1'
  fill_in 'new-password', with: 'pass1'
  fill_in 'new-password-confirm', with: 'pass1'
  click_on ('create-account')
end

def sign_up_same_grip
  visit('/')
  click_on ('sign-up')
  fill_in 'first-name', with: 'User2'
  fill_in 'surname', with: 'Two'
  fill_in 'new-email', with: 'user2@test.com'
  fill_in 'new-grip', with: 'user1'
  fill_in 'new-password', with: 'pass1'
  fill_in 'new-password-confirm', with: 'pass1'
  click_on ('create-account')
end

def sign_in
  visit('/')
  fill_in 'email', with: 'user1@test.com'
  fill_in 'password', with: 'pass1'
  click_on ('login')
end

def sign_in_wrong_email
  visit('/')
  fill_in 'email', with: 'wrong_user1@test.com'
  fill_in 'password', with: 'pass1'
  click_on ('login')
end

def sign_in_wrong_password
  visit('/')
  fill_in 'email', with: 'user1@test.com'
  fill_in 'password', with: 'pass1_wrong'
  click_on ('login')
end

def new_peep(content)
  click_on 'new_peep'
  fill_in 'content', with: content
  click_on 'submit_peep'

end