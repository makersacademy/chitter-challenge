def sign_up_new_user
  visit '/chitter'
  fill_in 'name', with: 'Sipho Adebayo'
  fill_in 'user-handle', with: 'Sips'
  fill_in 'email', with: 'sipho_adebayo@test.com'
  fill_in 'password', with: 'darby34'
  click_button "Sign up"
end
