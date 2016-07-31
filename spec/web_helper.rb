
def sign_up(email: 'bart@example.com',
              password: 'password',
              password_confirmation: 'password',
              name: 'Bart'
              user_name: 'The Judge')
  visit '/users/register'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :name, with: name
  fill_in :user_name, with: user_name
  click_button 'Register'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
