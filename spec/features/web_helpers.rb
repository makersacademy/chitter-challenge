def make_new_post
  visit '/posts/new'
  expect(page.status_code).to eq(200)
  fill_in :tip, with: 'Remember to eat your greens!'
  click_button 'Submit'
end

def sign_up(email: 'david@example.com',
            name: 'David',
            user_name: 'haletothewood',
            password: 'password!',
            password_confirmation: 'password!')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :name, with: name
  fill_in :user_name, with: user_name
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

def sign_out
  sign_up
  visit '/posts'
  click_button 'Sign Out'
end

def create_some_tips
  sign_up
  click_button 'Add New Tip'
  fill_in :tip, with: 'Remember to eat your greens!'
  click_button 'Submit'
  click_button 'Add New Tip'
  fill_in :tip, with: 'An apple a day keeps the doctor away'
end
