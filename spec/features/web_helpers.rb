def sign_in
  visit '/users/new'
  fill_in('email', with: 'example@lycos.com')
  fill_in('password', with: 'fakepassword')
  click_button("Submit")
end
