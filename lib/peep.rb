class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    sql = %{select * from peeps}
      # p sql
    peeps = connection.exec(sql)
    peeps.map {|record| {id: record["id"], peep: record["peep"]} }
  end

end
