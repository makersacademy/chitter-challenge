def sign_up(name: 'Tadas Majeris',
            username: 'tadan',
            email: 'tadas@gmail.com',
            password: 'tadadoo',
            password_confirmation: 'tadadoo')

  visit '/users/new'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Submit'
end
