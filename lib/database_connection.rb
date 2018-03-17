require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end

# body {
#   background-color: white;
#   background-image: url("https://img.fireden.net/tg/thumb/1462/43/1462430221995s.jpg");
#   background-repeat: no-repeat;
#   background-attachment: fixed;
#   background-position: center;
# }
