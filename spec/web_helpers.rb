def register
  visit '/users/register'
  fill_in(:email,     with: 'andy@andy.com')
  fill_in(:name,      with: 'andy')
  fill_in(:username,  with: 'k0zakinio')
  fill_in(:password,  with: '4ndyDragon')
  fill_in(:password_confirmation, with: '4ndyDragon')
  click_button('Submit')
end

def sign_in
  visit '/users/sign_in'
  fill_in(:email,     with: 'andy@andy.com')
  fill_in(:password,  with: '4ndyDragon')
  click_button('Submit')
end