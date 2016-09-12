def signup
  visit '/'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'erce'
  fill_in :email, with: 'erce@erce.com'
  fill_in :name, with: 'Erce Kal'
  fill_in :password, with: '123456'
  fill_in :password_confirmation, with: '123456'
  click_button 'Sign up'
end

def signin
  visit '/'
  fill_in :username, with: 'erce'
  fill_in :password, with: '123456'
  click_button 'Sign up'
end
