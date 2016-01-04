def sign_up
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in :username,    with: 'foobar'
  fill_in :email,    with: 'foobar@example.com'
  fill_in :name,    with: 'foo bar'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'password'
  click_button 'Sign up'
end

def bad_confirmation_sign_up
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in :username,              with: 'foobar'
  fill_in :email,                 with: 'foobar@example.com'
  fill_in :name,                  with: 'foo bar'
  fill_in :password,              with: 'password'
  fill_in :password_confirmation, with: 'different'
  click_button 'Sign up'
end

def no_email_sign_up
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in :username,    with: 'foobar'
  fill_in :name,    with: 'foo bar'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'different'
  click_button 'Sign up'
end

def invalid_email_sign_up
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in :username,    with: 'foobar'
  fill_in :email,    with: 'foobar@example'
  fill_in :name,    with: 'foo bar'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'different'
  click_button 'Sign up'
end

def sign_in(username:, password:)
  visit '/sessions/new'
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Sign in'
end

def peep_post
  fill_in :peep,    with: 'This is a test post 2'
  click_button 'post'
end
