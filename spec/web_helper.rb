def sign_up
  visit '/users/new'
  fill_in('name', with: 'Agata')
  fill_in('user_name', with: 'Agatina')
  fill_in('email', with: 'agata@gmail.com')
  fill_in('password', with: 'password')
  click_button('submit')

end

def sign_in
  visit '/sessions/new'
  fill_in('user_name', with: 'Agatina')
  fill_in('password', with: 'password')
  click_button 'Sign in'
end

def sign_out
end
