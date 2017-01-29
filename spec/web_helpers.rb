def sign_up
  visit '/'
  click_button('New User')
  fill_in(:name, with: 'Enrico Fermi')
  fill_in(:user_name, with: 'atom1901')
  fill_in(:email, with: 'efermi@gmail.com')
  fill_in(:password, with: 'nuclearReactor')
  fill_in(:password_confirmation, with: 'nuclearReactor')
  click_button('Sign Up')
end
