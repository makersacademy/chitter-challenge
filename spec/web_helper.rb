def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,    with: 'Joe Bloggs'
  fill_in :username,    with: 'JoeBloggs93'
  fill_in :email,    with: 'test@example.com'
  fill_in :password, with: '12345'
  fill_in :password_confirmation, with: '12345'
  click_button 'Sign up'
end

def sign_up_confirmation_wrong
  visit '/users/new'
  fill_in :name,    with: 'Joe Bloggs'
  fill_in :username,    with: 'JoeBloggs93'
  fill_in :email,    with: 'test@example.com'
  fill_in :password, with: '12345'
  fill_in :password_confirmation, with: 'hello'
  click_button 'Sign up'
end

def sign_up_no_email
  visit '/users/new'
  fill_in :name,    with: 'Joe Bloggs'
  fill_in :username,    with: 'JoeBloggs93'
  fill_in :password, with: '12345'
  fill_in :password_confirmation, with: '12345'
  click_button 'Sign up'
end

def sign_up_wrong_email
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,    with: 'Joe Bloggs'
  fill_in :username,    with: 'JoeBloggs93'
  fill_in :email,    with: 'test@example'
  fill_in :password, with: '12345'
  fill_in :password_confirmation, with: '12345'
  click_button 'Sign up'
end
