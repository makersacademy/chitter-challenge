def new_post(text)
  visit '/posts/new'
  fill_in 'content', with: text
  click_button 'Submit'
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'user@user.com'
  fill_in :password, with: 'password'
  click_button 'Sign up'
end
