require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_app_test')
    else
      con = PG.connect(dbname: 'chitter_app')
    end

    rs = con.exec("SELECT * FROM peeps")
    rs.map { |peep| peep['content'] }
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_app_test')
    else
      con = PG.connect(dbname: 'chitter_app')
    end

    rs = con.exec(
      "INSERT INTO peeps (content) VALUES ('#{content}');")
  end
end