require 'pg'

class Peep

  def self.create(description:)
      db = connect()
      db.exec("INSERT INTO peeps(description,user_id) VALUES('#{description}',0) RETURNING id,description,current_date")
  end

  def self.connect
      connection = 'chitter'
      connection = 'chitter_test' if ENV['ENVIRONMENT'] == 'test'
      db = PG.connect(dbname: connection)
  end

end
