def sign_up
  visit '/users/new'
  fill_in :Email,    with: 'owliver@owlmail.com'
  fill_in :password, with: 'imanowl!'
  click_button 'Sign up'
end
