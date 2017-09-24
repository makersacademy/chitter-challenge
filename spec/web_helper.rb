def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,        with: 'Jack Bauer'
  fill_in :user_name,   with: 'Jack24'
  fill_in :email,       with: 'jbauer@ctu.com'
  fill_in :password,    with: 'damn_it!'
  click_button 'Sign up'
end
