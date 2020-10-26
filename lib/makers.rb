require 'pg'

class Makers

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_members_test')
    else
      connection = PG.connect(dbname: 'chitter_members')
    end

    result = connection.exec('SELECT * FROM chitter_members_data;')
    result.map { |chitter| chitter['username'] }
  end

  def initialize(username)
    @username = username
  end


end
