require 'pg'

class Peeps

  def self.all
    set_env
    peep_feed = []
    all_peeps = @conn.exec( "SELECT * FROM peeps ORDER BY id DESC;") do |all|
      all.each do |message|
        peep_feed << message['peep']
      end
    end
    peep_feed
  end

  def self.create(peep:)
    set_env
    @conn.exec("INSERT INTO peeps(peep) VALUES('#{peep}');")
  end
end

private

  def set_env
    if ENV['ENVIRONMENT'] == 'test'
      @conn = PG.connect( dbname: 'chitter_test')
    else 
      @conn = PG.connect( dbname: 'chitter')
    end
  end