module SessionHelpers


def sign_up(full_name: 'User',
            username: 'user100',
            email: 'test100@test.com',
            password: 'Password123',
            password_confirmation: 'Password123')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :full_name, with: full_name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation

  fill_in :password, with: password
  click_button 'Sign up'
end

def sign_in(username:, password:)
   visit '/sessions/new'
   fill_in :username, with: username
   fill_in :password, with: password
   click_button 'Sign in'
end

end
