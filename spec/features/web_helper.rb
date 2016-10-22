def sign_up
  visit '/new_user'
  fill_in :name, with: 'Lilian Breidenbach'
  fill_in :username, with: 'Lilian2112'
  fill_in :email, with: 'lilian.gmail.com'
  fill_in :password, with: 'lemonaid'
  fill_in :password_confirmation, with: 'lemonaid'
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
