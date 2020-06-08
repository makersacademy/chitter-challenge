def fill_db
  visit('/')
  fill_in 'new_peep', with: 'This is my first peep'
  click_button('Peep')
  fill_in 'new_peep', with: 'tis but a peep'
  click_button('Peep')
  fill_in 'new_peep', with: 'nobody expects the spanish inquisition'
  click_button('Peep')
end

def sign_up
  visit('/')
  click_button('Sign up')
  fill_in 'name', with: 'Chris Cooney'
  fill_in 'email', with: 'test@testing.co.uk'
  fill_in 'user_name', with: 'ChrisCooney05'
  fill_in 'password', with: 'PasSWoRd'
  click_button('Submit')
end
