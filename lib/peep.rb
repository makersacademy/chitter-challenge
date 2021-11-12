require 'pg'

class Peep

  def self.all
    connection = PG.connect(dbname: "chitter#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['content'] }
  end
end


# INSERT INTO chit_user VALUES (1, 'test@test.com', 'test', 'Ginny', 'ginnyamazed');
# INSERT INTO chit_user VALUES (2, '1test@test.com', 'test', 'Jon', 'JonAZ');
# INSERT INTO chit_user VALUES (3, '2test@test.com', 'test', 'Grace', 'doglover');
# INSERT INTO chit_user VALUES (4, '3test@test.com', 'test', 'Jay', 'amorthian');
