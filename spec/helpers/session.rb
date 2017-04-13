
module SessionHelpers

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'clownfish@keepswimming.com'
  fill_in :password, with: 'Dory'
  fill_in :name, with: 'Nemo Clownfish'
  fill_in :username, with: 'Nemo123'
  click_button('Sign up')
end

end
