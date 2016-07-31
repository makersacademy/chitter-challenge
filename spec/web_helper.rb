
def sign_up
  visit '/users/register'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'BartJudge@gmail.com'
  fill_in :password, with: 'password'
  fill_in :name, with: 'Bart'
  fill_in :user_name, with: 'The Judge'
  click_button 'Register'
end
