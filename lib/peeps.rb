require 'pg'

class Peeps

  def self.all
    peep_feed = []
    connection = PG.connect(dbname: 'chitter')
    all_peeps = connection.exec( "SELECT * FROM peeps;") do |all|
      all.each do |message|
        peep_feed << message['peep']
      end
    end
    peep_feed
  end

  def self.create(peep:)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps(peep) VALUES('#{peep}');")
  end
end