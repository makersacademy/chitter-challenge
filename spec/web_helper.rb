def sign_up(name: 'Sity',
            username: 'sitypop',
            email: 'sity@ilovefalafel.com',
            password: 'secret',
            password_confirmation: 'secret')
  visit '/users/sign_up'
  expect(page.status_code).to eq(200)
  fill_in :name,     with: name
  fill_in :username, with: username
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email:, password:)
    visit '/users/sign_in'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
