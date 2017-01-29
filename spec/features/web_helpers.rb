def sign_up(email: "test@test.com", password: "password", password_confirmation: "password")
  visit('/')
  find(:css, "a[href='/users/new']").click
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('Submit')
end
