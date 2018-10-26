require_relative 'database_connection'
# require Date

class Peep

  def self.all
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'chitter_test')
    # else
    #   connection = PG.connect(dbname: 'chitter')
    # end

    sql = %{select id, peep, posted_datetime from peeps order by id desc}
      # p sql
    peeps = DatabaseConnection.query(sql)
    peeps.map { |record| { id: record["id"],
      peep: record["peep"],
      posted_date: Peep.date_only(record["posted_datetime"]) }
    }
  end

  def self.create(message)
    sql = %{INSERT INTO peeps
      (peep) VALUES ('#{message}') RETURNING id, peep, posted_datetime;}
      # p sql
    DatabaseConnection.query(sql)
  end

  def self.date_only(date)
    # p date
    # p date = Date.parse(date.to_s)
    date = DateTime.parse(date.to_s)
    date.strftime("%d/%m/%Y %H:%M:%S")
    # # p date.strftime("%D %m %Y")
    # p Date.strptime(date, "%d/%m/%Y")
    # # p Date.strptime(date, "%d/%m/%Y")
    # # (datex = Date.date.strftime("%d/%m/%Y").to_s)
    #   # newdate = Date.strptime(datex, "%d/%m/%Y")
    #   # p newdate

  end

end
