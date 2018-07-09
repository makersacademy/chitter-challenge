def sign_in_as_user
  User.create('horus', 'Horus Lupercal', 'warmaster@great-crusade.org', 'vengefulspirit')

  visit '/sessions/new'
  fill_in('sign_in_email', with: 'warmaster@great-crusade.org')
  fill_in('sign_in_password', with: 'vengefulspirit')
  click_button('Sign In')
end

def multiple_posts
  horus = User.create('horus', 'Horus Lupercal', 'warmaster@great-crusade.org', 'vengefulspirit')
  lorgar = User.create('lorgar', 'Lorgar Aurelian', 'worship@great-crusade.org', 'darkgods')
  fulgrim = User.create('fulgrim', 'Fulgrim Phoenician', 'emperorschildren@great-crusade.org', 'perfect')

  Peep.create('Let the Galaxy burn!', horus.id)
  Peep.create('The difference between gods and demons depends upon where one is standing', lorgar.id)
  Peep.create('Can it be possible for a thing to be too perfect?', fulgrim.id)
end
