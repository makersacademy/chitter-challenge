require 'pg'

class Chitter

  def self.create(context)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    con.exec("INSERT INTO peeps (context) VALUES ('#{context}');")
  end
  

end