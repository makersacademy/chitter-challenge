def sign_in
  visit('/')
  click_link('here', href: '/user/new')
  fill_in('username', with: 'Testy McTesterson')
  click_button('Sign up')
end
