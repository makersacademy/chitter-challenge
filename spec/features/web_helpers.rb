def make_new_post
  visit '/posts/new'
  expect(page.status_code).to eq(200)
  fill_in :tip, with: 'Remember to eat your greens!'
  click_button 'Submit'
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,     with: 'david@example.com'
  fill_in :name,      with: 'David'
  fill_in :user_name, with: 'haletothewood'
  fill_in :password,  with: 'password!'
  click_button 'Sign Up'
end
