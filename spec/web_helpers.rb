def sign_up(name: 'Robert',
            email: 'asdf@asdf.com',
            callsign: 'Rob-S',
            password: 'password',
            password_confirmation: 'password')
  visit '/user/new'
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :callsign, with: callsign
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "Sign Up"
end

def sign_in(email: 'asdf@asdf.com',
            password: 'password')
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button "Log In"
end
