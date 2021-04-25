def send_a_peep
  visit('/peep')
  fill_in('enter_peep', with: 'Hello, Chitter world!')
  click_button 'peep'
end