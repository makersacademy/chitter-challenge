def signup
  fill_in('name', with: 'Sandy')
  fill_in('last_name', with: 'Pounoussamy')
  fill_in('username', with: 'sandy974')
  fill_in('email', with: 'pounoussamy.sandy@gmail.com')
  fill_in('password', with: '1234')
  click_button('Submit')
end
