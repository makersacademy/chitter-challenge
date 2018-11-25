def register_new_user
  visit '/users/new'
  fill_in('name', with: 'Darryl Banks')
  fill_in('email', with: 'test@example.com')
  fill_in('user_name', with: 'dazza')
  fill_in('password', with: 'password123')
  click_button('submit')
end
