def sign_up_incorrectly(name: 'First User',
            username: 'number1',
            email: 'user@email.com',
            password: 'terriblepassword1',
            password_confirmation: 'terriblepassword')
  visit '/sign_up'
  expect(page.status_code).to eq(200)
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_up(name: 'First User',
            username: 'number1',
            email: 'user@email.com',
            password: 'terriblepassword1',
            password_confirmation: 'terriblepassword1' )
  visit '/sign_up'
  expect(page.status_code).to eq(200)
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
