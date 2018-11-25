def sign_in
  visit('/sessions/new')
  fill_in 'email', with: 'mystery@domain.com'
  fill_in 'password', with: '123456789'
  click_button 'Log in'
end
