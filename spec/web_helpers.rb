def insert_test_peeps  
  Peep.create(username: 'whatapalaver', peep: 'Test peep 1 - Deep')
  Peep.create(username: 'whatapalaver', peep: 'Test peep 2 - Deeper')
  Peep.create(username: 'whatapalaver', peep: 'Test peep 3 - Deepest')
end

def signup_test_user
  fill_in('username', with: 'whatawally')
  fill_in('name', with: 'Jim Wally')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
end

def signup_test_user2
  fill_in('username', with: 'wally')
  fill_in('name', with: 'Jane Wally')
  fill_in('email', with: 'wally@example.com')
  fill_in('password', with: 'password123')
end
