def sign_up
  visit ('/sign_up/new')
  fill_in('username', with: 'Buoyant Bobba')
  fill_in('name', with: 'Bobba Fett')
  fill_in('email_address', with: 'bobb@fett.com')
  fill_in('password', with: 'betterthanjango')
  fill_in('password_confirmation', with: 'betterthanjango')
  click_button('Save')
end
