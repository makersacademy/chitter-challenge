def sign_up(username: 'mrmurtz',
            email: 'murtz@gmail.com',
            password:  '1234',
            password_confirmation: '1234')
  visit '/users/new'
  fill_in('username', :with => username)
  fill_in('email', :with => email)
  fill_in('password', :with => password)
  fill_in('password_confirmation', :with => password_confirmation)
  click_button('Sign up')
end

def log_in(email: 'murtz@gmail.com',
          password: '1234')

  visit '/sessions/new'
  fill_in('email', :with => email)
  fill_in('password', :with => password)
  click_button('Log in')
end

def share_peep
  sign_up
  log_in
  click_button 'Share a peep'
  fill_in('peep', :with => "Hello my chitter peoples")
  click_button 'Peep'
end
