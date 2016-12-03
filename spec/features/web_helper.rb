def sign_up

  visit '/signup'
  expect(page.status_code).to eq 200
  fill_in 'first_name', with: 'Simon'
  fill_in 'surname', with: 'Conway'
  fill_in 'Email', with: 'simon.conway@condaal.com'
  fill_in 'password', with: 'Password'
  click_button('Sign up')

end

def sign_in

  visit '/signin'
  expect(page.status_code).to eq 200
  fill_in 'Email', with: 'simon.conway@condaal.com'
  fill_in 'password', with: 'Password'
  click_button('Sign in')

end
