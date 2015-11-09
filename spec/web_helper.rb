def sign_up(email: 'coco@gmail.com',
              password: 'lila',
              password_confirmation: 'lila',
              name: 'Julien',
              user_name: 'coco')
  visit('/users/new')
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :name, with: name
  fill_in :user_name, with: user_name
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit('/sessions/new')
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def create_peep(email:, password:, content:)
  sign_in(email: email, password: password)
  fill_in :content, with: content
  click_button 'Submit your peep'
end
