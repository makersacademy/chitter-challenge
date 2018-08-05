def insert_test_peeps  
  peep_1 = Peep.create(username: 'whatapalaver', peep: 'Test peep 1 - Deep')
  peep_2 = Peep.create(username: 'whatapalaver', peep: 'Test peep 2 - Deeper')
  peep_3 = Peep.create(username: 'whatapalaver', peep: 'Test peep 3 - Deepest')
end