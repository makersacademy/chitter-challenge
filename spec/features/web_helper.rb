def sign_up
  visit '/'
  expect(page.status_code).to eq 200
  click_button 'New Account'
  fill_in :name, with: 'Bob'
  fill_in :username, with: 'bobross'
  fill_in :email, with: 'bob@ross.com'
  fill_in :password, with: 'bobross'
  click_button 'Sign me up!'
end
