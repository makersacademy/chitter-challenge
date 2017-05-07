def sign_up
  visit '/'
  click_link 'Sign up'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'chittychitty@peeppeep.com'
  fill_in :name, with: 'John'
  fill_in :username, with: 'chitmeister49'
  fill_in :password, with: 'peep247'
  click_button 'Sign up'
end
