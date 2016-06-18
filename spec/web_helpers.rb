def sign_up
  visit '/'
  click_button 'sign up'
  fill_in(:name, with: 'Kenneth Barrett')
  fill_in(:username, with: 'kennbarr')
  fill_in(:email, with: 'ken@ken.com')
  fill_in(:password, with: 'ocelot')
  fill_in(:password_confirmation, with: 'ocelot')
  click_button 'sign up'
end
