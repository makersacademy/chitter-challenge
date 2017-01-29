def sign_up(user_email: 'joebloggs@hotmail.com',
            password: 'P@ssw0rd1234',
            password_confirmation: 'P@ssw0rd1234',
            user_full_name: 'Joe Bloggs',
            user_name: 'Joeb')

  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in 'user_email', with: user_email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  fill_in 'user_full_name', with: user_full_name
  fill_in 'user_name', with: user_name
  click_button 'Sign Up'
end

def sign_in(user_email:, password:)
   visit '/sessions/new'
   fill_in :user_email, with: user_email
   fill_in :password, with: password
   click_button 'Sign in'
 end
