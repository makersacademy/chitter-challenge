def sign_up

  visit '/'
  expect(page).to have_button 'Sign up'
  find('#sign_up').click
  fill_in 'Username', with: 'rufusraghunath'
  fill_in 'Real name', with: 'Rufus Raghunath'
  fill_in 'Email', with: 'rufus@me.com'
  fill_in 'Password', with: '1234'
  fill_in 'Confirm password', with: '1234'
  click_button 'Sign up'

end
