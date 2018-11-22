require 'pg'

class Peep
  attr_reader :id, :description, :creation_date, :creation_time

  def initialize(id:, description:, creation_date:, creation_time:)
    @id = id
    @description = description
    @creation_date = creation_date
    @creation_time = creation_time
  end

  def self.create(description:)
      db = connect()
      db.exec("INSERT INTO peeps(description,user_id) VALUES('#{description}',0) RETURNING id,description,current_date")
  end

  def self.all
    db = connect()

    result = db.exec("SELECT * FROM peeps ORDER BY id DESC;")

    result.map { |peep| Peep.new(id: peep['id'], description: peep['description'], creation_date: peep['creation_date'], creation_time: peep['creation_time'])}
  end

  def self.connect
      connection = 'chitter'
      connection = 'chitter_test' if ENV['ENVIRONMENT'] == 'test'
      db = PG.connect(dbname: connection)
  end

end
