module Helpers

def sign_up(email: 'alfie@gmail.com', password: 'coding',
                password_confirmation: 'coding')
  visit '/users/new'
  fill_in('username', with: 'alfie')
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button 'Sign up'
end


end
