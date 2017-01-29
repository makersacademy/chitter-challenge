def sign_up(email: 'eric@example.com',
            password: 'password1',
            password_confirmation: 'password1')
  visit '/signup'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up'
end

def sign_in(email: 'eric@example.com',
            password: 'password1')
  visit '/login'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Login'
end

def newpeep(words: 'have a banana')
  visit '/newpeep'
  fill_in :words, with: words
  click_button 'Peep'
end
