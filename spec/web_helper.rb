def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name, with: 'Musashi'
  fill_in :user_name, with: 'shogun'
  fill_in :email,    with: 'shogun@katana.com'
  fill_in :password, with: 'harakiri!'
  fill_in :password_confirmation, with: 'harakiri!'
  click_button 'Sign up'
end

