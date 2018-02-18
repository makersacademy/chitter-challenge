def sign_up
  visit '/'
  click_button 'Sign up'
  fill_in("name", with: "Another")
  fill_in("username", with: "MarcoAsensio")
  fill_in("email", with: "asensio2@example.es")
  fill_in("password", with: "only4m")
  click_button 'Submit'
end

def sign_in
  visit '/'
  click_button 'Sign in'
  expect(current_path).to eq '/sessions/new'

  fill_in(:email, with: 'asensio@example.es')
  fill_in(:password, with: 'only3m')
  click_button 'Submit'
end
