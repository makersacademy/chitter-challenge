def connect_delete_and_create_data
  connection = PG.connect(dbname: 'chitter_chatter_test')
  connection.exec('TRUNCATE peeps, users RESTART IDENTITY CASCADE;')
  Peep.create("My first peep")
  Peep.create("I have just added this")
end