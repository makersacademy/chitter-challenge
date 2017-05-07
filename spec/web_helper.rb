def sign_up(email: 'chittychitty@peeppeep.com',
            name: 'John',
            username: 'chitmeister49',
            password: 'peep247',
            password_confirmation: 'peep247')
  visit '/'
  click_link 'Sign up'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
