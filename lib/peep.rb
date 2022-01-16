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
    peeps.map { |peep| peep['message'] }

  end  

  def self.create(user_name:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end

    con.exec("INSERT INTO peeps (user_name, message) VALUES('#{user_name}', '#{message}')")
  end

end
