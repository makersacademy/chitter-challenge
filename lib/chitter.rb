require 'pg'
require_relative 'peep'

class Chitter

  def self.log
    if ENV["ENVIRONMENT"] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps")

    result.map do |peep|
      Peep.new(peep: peep['peep'], username: peep['username'], post_time: peep['post_time'])
    end

  end

  def self.add_peep(peep:)
    if ENV["ENVIRONMENT"] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (peep, username, post_time) VALUES('#{peep.peep}',
    '#{peep.username}', '#{peep.post_time}')")
  end

end
