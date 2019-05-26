require 'pg'

class Chitter

  attr_reader :id, :peep

  def initialize(id:, peep:) 
    @id = id
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else 
      con = PG.connect :dbname => 'chitter'
    end
    # con.exec "SELECT * FROM chitter;"
    chitter_feed = con.exec "SELECT * FROM chitter ORDER BY id DESC;"
    chitter_feed.map do |feed| 
      Chitter.new(id: feed['id'], peep: feed['peep'])
    end
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else 
      con = PG.connect :dbname => 'chitter'
    end
    # con.exec("INSERT INTO chitter(peep) VALUES('#{message}');")
    result = con.exec("INSERT INTO chitter(peep) VALUES('#{message}') RETURNING id, peep;")
    Chitter.new(id: result[0]['id'], peep: result[0]['peep'])
  end

#   def self.delete(id:)
#     if ENV['ENVIRONMENT'] == 'test'
#       con = PG.connect :dbname => 'bookmark_manager_test'
#     else 
#       con = PG.connect :dbname => 'bookmark_manager'
#     end
#     con.exec("DELETE FROM bookmarks WHERE id = '#{id}';")
#   end
end