require 'peep'
require './lib/database/database_helper'

class Chitter
  def postPeep(peep)
    rs = DatabaseConnection.query("INSERT INTO chitters (peep, create_date) VALUES ('#{peep}', current_timestamp) RETURNING id, peep, create_date")
    return Peep.new(id: rs[0]["id"],peep: rs[0]["peep"],timestamp: rs[0]["timestamp"]) if rs
  end

  def getPeeps
    rs = DatabaseConnection.query("select id, peep, create_date from chitters")
    peeps = []
    if rs
      rs.each do |row|
        peeps << Peep.new(id: row["id"],peep: row["peep"],timestamp: row["timestamp"])
      end
    end
    peeps
  end
end
