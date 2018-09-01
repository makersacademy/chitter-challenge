require 'pg'

class Peeps

  def self.all
    result = database_connect.exec("SELECT * FROM peeps;")
    result.map { |peeps| peeps }
  end

  def self.create(peep)
    database_connect.exec("INSERT INTO peeps (peep, created_at) VALUES('#{peep}', '#{created_time}');")
  end

  def self.created_time
    return Time.at(Time.now.to_i).strftime("%B %e, %Y at %I:%M %p")
  end

  def self.database_connect
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

end
