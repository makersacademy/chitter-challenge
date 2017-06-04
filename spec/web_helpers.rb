def enter_peep
  visit('/peeps/new')
  fill_in('message', with: 'test message')
  click_button('Peep now')
end

def sign_up(email: 'john@doe.com',
            password: 'password',
            password_confirmation: 'password')
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email: 'john@doe.com',
            password: 'password')
  visit '/'
  expect(page.status_code).to eq(200)
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Sign In'
end
