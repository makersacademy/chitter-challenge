require 'pg'

class DBConnection
  def self.query(query)
    database = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
    conn = PG.connect(dbname: database)

    begin
      result = conn.exec(query)
    rescue StandardError => e
      conn.close
      raise e
    end

    conn.close
    result
  end
end
