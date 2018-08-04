def insert_test_peeps
  Peep.add('limcuili', 'I got peep.add to work as a method!')
  Peep.add('limcuili', 'I can now post multiple peeps.')
  Peep.add('limcuili', 'Let us add a third because I like #3')
end

def insert_username_and_go
  visit '/'
  fill_in 'username', with: 'limcuili'
  click_button 'Go!'
end
