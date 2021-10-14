def add_first_peep
  visit '/peeps'
  fill_in('peep', with: 'Hello world')
  click_button('Post')
end

def sign_up
  visit '/'
  click_button 'Sign Up'
  fill_in('username', with: 'CRISPR')
  fill_in('email', with: 'cispr@yahoo.com')
  fill_in('password', with: '123456')
  click_button('Submit')
end
