def sign_in
  visit '/chitter'
  # fill_in('name', with: 'Spiderman')
  # fill_in('username', with: 'Spidy')
  # fill_in('email', with: 'webblaster@gmail.com')
  # fill_in('password', with: '123456')
  fill_in('Add message', with: 'Tomorrow the elephants will dance.')
  click_button('Submit')
end
