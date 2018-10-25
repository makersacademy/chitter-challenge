require 'pg'

class Chitter

attr_reader :id, :name, :username, :text, :time

  def initialize(id, name, username, text, time)
    @id = id
    @name = name
    @username = username
    @text = text
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter_manager'
    end
      rs = con.exec "SELECT * FROM peeps ORDER BY time DESC"
      rs.map do |peep|
        Chitter.new(peep['id'], peep['name'], peep['username'], peep['text'], peep['time'])
      end
  end

  def self.create_peep(name, username, text)
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter_manager'
    end
      con.exec "INSERT INTO peeps (name, username, text) VALUES('#{name}', '#{username}', '#{text}');"
  end

end
