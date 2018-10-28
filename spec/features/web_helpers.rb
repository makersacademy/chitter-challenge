def login
  visit('/sessions/new')
  fill_in('email', with: 'harry@enfield.com')
  fill_in('password', with: 'password')
  click_button('Sign in')
end
