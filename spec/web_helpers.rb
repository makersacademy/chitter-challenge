def vist_and_signup
  visit '/chitter'
  click_button('Sign up')
  fill_in('name', with: 'Aga')
  fill_in('username', with: 'Agausername')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Submit')
end
