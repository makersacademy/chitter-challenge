def sign_up_and_visit
  name = 'Steve Mandanda'
  username = 'Marseille_Captain'
  password =  'lepassword'
  email_address =  'marseille_number_1@marseille.fc'

  visit('/users/new')
  fill_in('name', with: name)
  fill_in('username', with: username)
  fill_in('password', with: password)
  fill_in('email_address', with: email_address)
  click_button('Create User')
end
