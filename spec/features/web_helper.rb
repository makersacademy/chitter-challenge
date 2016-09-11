def sign_up(email: 'stf@me.com', password: '123a', password_confirmation: '123a',
            name: 'Stephan Gaud', nickname: 'stf' )
  visit '/sign_up'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :name, with: name
  fill_in :nickname, with: nickname
  click_button 'Sign Up'
end
