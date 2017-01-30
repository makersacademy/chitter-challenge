def sign_up(email: '92jackhenderson@gmail.com', password: 'wordpass',
  password_confirmation: 'wordpass', name: 'Jack Henderson', user_name: 'art_ful_gar_funk')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :name, with: name
  fill_in :user_name, with: user_name
  click_button("Sign Up")
end
