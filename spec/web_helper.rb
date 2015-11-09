def sign_up
  visit ('/')
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'amy@awesome.com'
  fill_in :password, with: 'apple'
  fill_in :password_confirmation, with: 'apple'
  fill_in :name, with: 'Amy Yang'
  fill_in :user_name, with: 'Mongolian Princess'
  click_button('Sign up')
end

def sign_in(name: 'amy',
           password: '123')
  visit '/signin/new'
  click_button('Sign in')
  fill_in :email, with: email
  fill_in :password, with: password
  click_button('Sign in')
end
