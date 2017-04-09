def sign_up_steph
  visit '/user/new'
  fill_in('name', with: 'Steph')
  fill_in('username', with: 'StephanieJane')
  fill_in('email', with: 'Steph@stephanie.com')
  fill_in('password', with: 'steph123')
  fill_in('password_confirmation', with: 'steph123')
  click_button 'Submit'
end

def sign_up_jane
  visit '/user/new'
  fill_in('name', with: 'Jane')
  fill_in('username', with: 'JaneStephanie')
  fill_in('email', with: 'Jane@jane.com')
  fill_in('password', with: 'jane123')
  fill_in('password_confirmation', with: 'jane123')
  click_button 'Submit'
end
