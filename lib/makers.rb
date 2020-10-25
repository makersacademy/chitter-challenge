require 'pg'

class Makers

  def self.all
    connection = PG.connect(dbname: 'chitter_members')
    result = connection.exec('SELECT * FROM chitter_members_data;')
    result.map { |chitter| chitter['username'] }
  end

  def initialize(username)
    @username = username
  end


end
