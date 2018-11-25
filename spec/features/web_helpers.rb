def create_user
  visit '/users/new'
  fill_in('email', with: 'test_email@notreal.com')
  fill_in('password', with: 'password123');
  fill_in('user_name', with: '@testuser');
  fill_in('name', with: 'Joe Bloggs');
  click_on('Submit');
end

def sign_in
  visit '/sessions/new'
  fill_in(:email, with: 'test_email@not_real.com')
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end
