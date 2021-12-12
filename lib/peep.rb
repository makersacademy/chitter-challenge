require './app'
require 'pg'

class Peep

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map do |peep|
      Chitter.new(id: peep["id"], peep: peep["peep"])
    end
  end


end