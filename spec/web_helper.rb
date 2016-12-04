def sign_up(name: 'Amanda',
            username: 'amanda',
            email: 'hello@example.com',
            password: 'password',
            password_confirmation: 'password')
  visit('/users/sign-up')
  expect(page.status_code).to eq(200)
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'sign up'
end

def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'sign in'
end
