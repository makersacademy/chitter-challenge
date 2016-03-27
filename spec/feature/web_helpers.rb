
def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'Simon'
  fill_in :email,    with: 'test@test.com'
  fill_in :password, with: '123'
  fill_in :password_confirmation, with: '123'
  click_button 'Submit'
end

def sign_up_not_matching_password
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'Simon'
  fill_in :email,    with: 'test@test.com'
  fill_in :password, with: '123'
  fill_in :password_confirmation, with: '155'
  click_button 'Submit'
end
