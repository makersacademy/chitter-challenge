def register_frodo_swaggins
  visit '/register'
  fill_in 'username', with: 'FrodoSwaggins'
  fill_in 'firstname', with: 'Frodo'
  fill_in 'lastname', with: 'Baggins'
  fill_in 'email', with: 'the1ring@gmail.com'
  fill_in 'password', with: 'ilovetheshire'
  click_button 'Register'
end

def login_as_gimli
  User.create user: 'GIMLITHEGREAT', firstname: 'gimli', lastname: 'son of gloin', email: 'outscoredpointyear@gmail.com', password: 'erebor'
  visit '/'
  fill_in 'username', with: 'GIMLITHEGREAT'
  fill_in 'password', with: 'erebor'
  click_button 'sign in'
end
