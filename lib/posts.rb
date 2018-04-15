require 'pg'

class Posts

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      @con = PG.connect(dbname: 'chitter_test')
    else
      @con = PG.connect(dbname: 'chitter')
    end
    posts = @con.exec("SELECT * FROM peeps;")
    posts.map { |row| row["peep"] }
  end

  def self.add(new)
    @con.exec("INSERT INTO peeps (peep) VALUES ($1)", [new])
  end

end
