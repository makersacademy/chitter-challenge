def sign_up(email: 'test@email.com',
            username: 'test_user',
            name: 'Test McTest',
            password: '1234',
            password_confirmation: '1234')
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in 'email', with: email
  fill_in 'username', with: username
  fill_in 'name', with: name
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign Up'
end

def sign_in(email: 'test@email.com', password: 'pass')
  visit '/sessions/new'
  expect(page.status_code).to eq 200
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Sign In'
end

def post_a_peep(content: 'This is a peep!')
  visit '/peeps/new'
  expect(page.status_code).to eq 200
  fill_in :peep, with: content
  click_button 'Submit'
end
