require 'pg'

def truncates
  DatabaseConnection.query('TRUNCATE peeps RESTART IDENTITY')
end

def add_peep
  Peep.create('Lin', '@LinnyCodes', 'Hey, this is my first test peep!')
  Peep.create('Makers', '@MakersAcademy', 'Second peep!')
  Peep.create('Jayda', '@JMakers', 'Peep-a-boo!')
end