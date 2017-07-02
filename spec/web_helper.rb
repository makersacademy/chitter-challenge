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

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in 'username', with: 'Mary'
  fill_in 'email', with: 'example@example.com'
  fill_in 'password', with: '123456'
  click_button 'Sign up'
end
