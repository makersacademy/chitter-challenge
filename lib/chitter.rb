require 'pg'

class ChitterNew
  attr_reader :url, :id
  def initialize(url, id)
    @id = id
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'logins_test' )
    else
      conn = PG.connect( dbname: 'chitter_logins' )
    end
    result = conn.exec( "SELECT * FROM logins" ) 
    result.map { |login| ChitterNew.new(login['id'], login['url']) }
  end

  def self.create(url:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'logins_test' )
    else
      conn = PG.connect( dbname: 'chitter_logins' )
    end
      result = conn.exec( "INSERT INTO logins (url) VALUES ('#{url}') RETURNING id, url" )

  end
end