class Cheet

  attr_reader :id, :user, :cheet

  def initialize(id, user, cheet)
    @id = id
    @user = user
    @cheet = cheet
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_database_test')
    else
      conn = PG.connect(dbname: 'chitter_database')
    end
    result = conn.exec( "SELECT * FROM cheets" )
    result.map { |row| Cheet.new(row['id'], row['user'], row['cheet']) }
  end

  def self.create(cheet)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_database_test')
    else
      conn = PG.connect(dbname: 'chitter_database')
    end
      conn.exec("INSERT INTO cheets (cheet) VALUES ('#{cheet}');")
  end

end
