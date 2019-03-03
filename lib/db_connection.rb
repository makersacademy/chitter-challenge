class DatabaseConnection

  def initialize
    ENV['ENVIRONMENT'] == 'test' ? @conn = PG.connect(dbname: 'chitter_test') : @conn = PG.connect(dbname: 'chitter')
  end

  def run_query(string)
    result = @conn.exec(string)
    return result
  end
end
