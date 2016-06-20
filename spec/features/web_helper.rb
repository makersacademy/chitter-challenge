
def sign_up(name: 'Alex',
            user_name: 'as4273',
            email: 'alex@hotmail.com',
            password: 'test1234',
            password_confirmation: 'test1234')
  visit '/users/new'
  fill_in :name, with: name
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up'
end

def sign_in(email: 'alex@hotmail.com',
            password: 'test1234')
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign In'
end