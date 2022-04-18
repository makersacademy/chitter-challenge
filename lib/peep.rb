class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PGConn.open(dbname: 'chitter_test')
    else
      onnection = PGConn.open(dbname: 'chitter')
    end
  
    result = connection.exec("SELECT * FROM chitter")
    result.map { |chitter| chitter['title'] }
  end

  def self.sort_all_peeps(peeps = Peep.all)
    chronological_peeps = peeps.sort_by do |peep|
      p peep
      Time.parse(peep.time)
    end
      chronological_peeps.reverse
  end
end
  