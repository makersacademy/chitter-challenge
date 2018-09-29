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

def add_some_users
  User.create user: 'GIMLITHEGREAT', firstname: 'gimli', lastname: 'son of gloin', email: 'outscoredpointyear@gmail.com', password: 'erebor'
  User.create user: 'aragorn', firstname: 'aragorn', lastname: 'son of arathorn', email: 'nextkingofgondor@gmail.com', password: 'anduril'
  User.create user: 'faramir', firstname: 'faramir', lastname: 'steward of gondor', email: 'mybrotherwasaboss@gmail.com', password: 'osgiliath'
  User.create user: 'bombadillo', firstname: 'tom', lastname: 'bombadil', email: 'mostpowerful@gmail.com', password: 'gardener'
end
