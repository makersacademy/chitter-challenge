def signup

  visit '/signup'
  fill_in('email', with: 'test@email.com')
  fill_in('username', with: 'testusername')
  fill_in('name', with: 'Test Name')
  fill_in('password', with: 'Test Password')
  click_button('Submit')
end

def signin
  visit '/sessions/new'
  fill_in(:email, with: 'test@email.com')
  fill_in(:password, with: 'Test Password')
  click_button('Sign In')

end
