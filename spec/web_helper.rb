def post_multiple_peeps
  visit('/peeps/new')
  fill_in 'peep_content', with: 'This is my first peep'
  click_buttons
  fill_in 'peep_content', with: 'This is my second peep'
  click_buttons
  fill_in 'peep_content', with: 'This is my third peep'
  click_button('Peep')
end

def click_buttons
  click_button('Peep')
  sleep 0.5
  click_button('New Peep')
end

def sign_up(username: 'Example McExampler',
            email: 'example@example.com',
            password: '123456',
            password_confirmation: '123456')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

def sign_up_wrong_password(username: 'Example McExampler',
            email: 'example@example.com',
            password: '123456',
            password_confirmation: '12345')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up'
end
