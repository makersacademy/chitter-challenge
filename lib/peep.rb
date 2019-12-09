require 'pg'

class Peep

  attr_reader :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    con = connect_database
    peeps = con.exec('SELECT * FROM chitter')
    peeps.map do |peep|
      Peep.new(id: peep['id'], message: peep['msg'])
    end
  end

  def self.create(message:)
    con = connect_database
    result = con.exec("INSERT INTO chitter (msg) VALUES('#{message}') RETURNING id, msg;")
    Peep.new(id: result[0]['id'], message: result[0]['msg'])
  end

  def self.connect_database
    database = ENV['ENVIRONMENT'] == 'test' ? 'chitter_chatter_test' : 'chitter_chatter'
    con = PG.connect(dbname: database)
  end

end
