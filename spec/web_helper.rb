def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with:'92jackhenderson@gmail.com'
  fill_in :password, with:'wordpass'
  fill_in :password_confirmation, with:'wordpass'
  fill_in :name, with: 'Jack Henderson'
  fill_in :user_name, with: 'art_ful_gar_funk'
  click_button("Sign Up")
end
