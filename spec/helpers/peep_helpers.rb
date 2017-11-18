def new_peep(content)
  sign_up('name', 'username', 'mail@test.test', '2', '2')
  sign_in('mail@test.test', '2')
  click_button 'New Peep'
  fill_in 'content', with: content
  click_button 'Peep It'
end

def cancelled_peep
  sign_up('name', 'username', 'mail@test.test', '2', '2')
  sign_in('mail@test.test', '2')
  click_button 'New Peep'
  fill_in 'content', with: 'Test peep'
  click_button 'Cancel'
end
