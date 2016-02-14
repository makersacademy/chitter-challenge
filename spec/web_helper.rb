def create_account
  visit('/signup')
  fill_in(:username, with: 'Chet')
  fill_in(:password, with: 'cutthechatterred2')
  click_button('Sign up!')
end