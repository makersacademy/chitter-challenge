def sign_up
  visit ('/')
  fill_in :email, with: 'amy@awesome.com'
  fill_in :password, with: 'apple'
  fill_in :name, with: 'Amy Yang'
  fill_in :user_name, with: 'Mongolian Princess'
  click_button('Sign up')
end
