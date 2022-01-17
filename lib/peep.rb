require 'pg'

class Peep

  attr_reader :message

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
    peeps = con.exec "SELECT * FROM peeps"
    peeps.map { |peep| peep}

  end  

  def self.create(message:, posted_at: Time.now)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end

    con.exec("INSERT INTO peeps (message, posted_at) VALUES('#{message}', '#{posted_at}') RETURNING id, message, posted_at")
  end

end
