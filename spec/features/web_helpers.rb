def sign_up boolean
  visit '/'
  find('#sign_up').click
  fill_in 'Username', with: 'rufusraghunath'
  fill_in 'Real name', with: 'Rufus Raghunath'
  fill_in 'Email', with: 'rufus@me.com'
  fill_in 'Password', with: '1234'
  if boolean
    fill_in 'Confirm password', with: '1234'
  else
    fill_in 'Confirm password', with: '5678'
  end
  click_button 'Sign up'
end

def sign_out
  find('#sign_out').click
end

def sign_in
  visit('/')
  find('#sign_in').click
  fill_in 'Email', with: 'rufus@me.com'
  fill_in 'Password', with: '1234'
  click_button 'Sign in'
end
