def add_peeps_test
  connection = PG.connect(dbname: 'chitter_test_db')
  connection.exec("INSERT INTO messages(name, message) VALUES('James', 'This is my very first peep!');")
  connection.exec("INSERT INTO messages(name, message) VALUES('Vera', 'I would also like to say something and this is what I want to say');")
  connection.exec("INSERT INTO messages(name, message) VALUES('Maureen', 'I have something to say as well');")
end