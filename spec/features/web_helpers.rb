def make_new_post
  visit '/posts/new'
  expect(page.status_code).to eq(200)
  fill_in :tip, with: 'Remember to eat your greens!'
  click_button 'Submit'
end

def sign_up(email: 'david@example.com',
            password: 'password!',
            password_confirmation: 'password!')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign In'
end
