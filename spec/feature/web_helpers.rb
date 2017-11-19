def sign_up(email, password, confirmation_password)
  visit '/'
  within('form#sign_up') do
    fill_in 'name', with: 'Andrew'
    fill_in 'username', with: 'Andy'
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'confirmation_password', with: confirmation_password
    click_button 'Submit'
  end
end
