def sign_up(name: 'Jack Bauer',
            user_name: 'Jack24',
            email: 'jbauer@ctu.com',
            password: 'damn_it!',
            password_confirmation: 'damn_it!')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,        with: name
  fill_in :user_name,   with: user_name
  fill_in :email,       with: email
  fill_in :password,    with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
