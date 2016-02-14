def user_signup
  visit('/user/new')
    fill_in :email, with: 'heather@test.com'
    fill_in :name, with: 'Heather Campbell'
    fill_in :username, with: 'heathercamcam'
    fill_in :password, with: 'chitter'
    fill_in :password_confirmation, with: 'chitter'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
