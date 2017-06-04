def enter_peep
  visit('/peeps/new')
  fill_in('message', with: 'test message')
  click_button('Peep now')
end
