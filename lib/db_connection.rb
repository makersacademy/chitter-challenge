class DatabaseConnection

  def initialize
    ENV['ENVIRONMENT'] == 'test' ? @conn = PG.connect(dbname: 'chitter_test') : @conn = PG.connect(dbname: 'chitter')
  end

  def run_query(string)
    return @conn.exec(string)
  end
end
