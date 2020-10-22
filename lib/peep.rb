require 'pg'

class Peep
  attr_reader :id, :username, :body, :posted_on

  def initialize(id:, username:, body:, posted_on:)
    @id = id
    @username = username
    @body = body 
    @posted_on = posted_on
  end

  def self.all
    connect_to_db

    result = @@con.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], username: peep['username'], body: peep['body'], posted_on: peep['posted_on'])
    end
  
  end

  def self.connect_to_db
    if ENV['RACK_ENV'] == 'test'
      @@con = PG.connect(dbname: 'chitter_test')
    else
      @@con = PG.connect(dbname: 'chitter')
    end
  end
end
