def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'clownfish@keepswimming.com'
  fill_in :password, with: 'Dory'
  fill_in :password_confirmation, with: 'Dory'
  fill_in :name, with: 'Nemo Clownfish'
  fill_in :username, with: '@NemoClown'
  click_button('Sign up')
end
