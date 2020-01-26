require 'pg'

class DatabaseConnection
  @connnection

  def self.setup(db_name)
    if ENV['DATABSE_URL']
      uri = URI.parse(ENV['DATABASE_URL'])
      @connection = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
    else
      @connection = PG::Connection.open(:dbname => db_name )
    end
  end

  def self.query(query)
    result = @connection.exec(query)
  end
end