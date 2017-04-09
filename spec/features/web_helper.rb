def sign_up
  visit('/user/new')
  fill_in('email', with: 'a@gmail.com')
  fill_in('password', with: '1234')
  fill_in('password_confirmation', with: '1234')
  fill_in('name', with: 'Amelie')
  fill_in('user_name', with: 'A-dawg')
  click_button("Submit")
end

def sign_up_b
  visit('/user/new')
  fill_in('email', with: 'b@gmail.com')
  fill_in('password', with: '12345')
  fill_in('password_confirmation', with: '12345')
  fill_in('name', with: 'Benji')
  fill_in('user_name', with: 'B-dawg')
  click_button("Submit")
end

def write_a_peep
  click_button 'New peep'
  fill_in :message, with: 'Lorem ipsum'
  click_button 'Peep'
end

def write_another_peep
  click_button 'New peep'
  fill_in :message, with: 'Smelly cat'
  click_button 'Peep'
end
