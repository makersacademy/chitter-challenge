def sign_up
  visit('/')
  fill_in('username', with: 'tc1316', :match => :first)
  fill_in('email', with: 'tc1316@ic.ac.uk', :match => :first)
  fill_in('password', with: 'abc123', :match => :first)
  fill_in('confirm_password', with: 'abc123', :match => :first)

  click_button('Sign up')
end
