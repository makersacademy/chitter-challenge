def sign_up
  visit '/sign_up'
  fill_in('name', with: 'Agata')
  fill_in('user_name', with: 'Agatina')
  fill_in('email', with: 'agata@gmail.com')
  fill_in('password', with: 'password')
  click_button('submit')

end
