def sign_up
  visit '/users/new'
  fill_in 'email', with: 'joe@example.com'
  fill_in 'name', with: 'Joe Bloggs'
  fill_in 'username', with: 'BloggsyMalone'
  fill_in 'password', with: 'shoobydooby'
  fill_in 'password_confirmation', with: 'shoobydooby'
  click_button 'submit'
end
