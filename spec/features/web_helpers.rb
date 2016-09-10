def sign_up_correct_password
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'matt@matt.com'
  fill_in :password, with: 'vickers'
  fill_in :password_confirmation, with: 'vickers'
  click_button 'Sign up'
end

def sign_up_wrong_password
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'matt@matt.com'
  fill_in :password, with: 'vickers'
  fill_in :password_confirmation, with: 'somethingelse'
  click_button 'Sign up'
end
