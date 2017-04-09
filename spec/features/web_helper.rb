def sign_up
  visit('/user/new')
  fill_in('email', with: 'a@gmail.com')
  fill_in('password', with: '1234')
  fill_in('password_confirmation', with: '1234')
  click_button("Submit")
end

def sign_up_b
  visit('/user/new')
  fill_in('email', with: 'b@gmail.com')
  fill_in('password', with: '12345')
  fill_in('password_confirmation', with: '12345')
  click_button("Submit")
end

def write_a_peep
  click_button 'New peep'
  fill_in :message, with: 'Lorem ipsum'
  click_button 'Peep'
end
