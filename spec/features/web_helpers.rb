def sign_in_as_user
  User.create('horus', 'Horus Lupercal', 'warmaster@great-crusade.org', 'vengefulspirit')

  visit '/sessions/new'
  fill_in('sign_in_email', with: 'warmaster@great-crusade.org')
  fill_in('sign_in_password', with: 'vengefulspirit')
  click_button('Sign In')
end
