def sign_up(email: 'tudor@yahoo.com', password: '12345', password_confirmation: '12345', name: "tudor", username: "tudorpp")
  visit('/users/new')
  expect(page.status_code).to eq(200)
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  fill_in('name', with: name)
  fill_in('username', with: username)
  click_button('Sign up')
end

def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
end
