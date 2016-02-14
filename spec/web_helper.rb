
def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,     with: 'Iryna'
  fill_in :username, with: 'irisha'
  fill_in :email,    with: 'iryna@mail.com'
  fill_in :password, with: 'chitter!'
  click_button 'Sign up'
end