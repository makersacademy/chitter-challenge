require 'pg'

class Chitter

  attr_reader :id, :username, :peep_time, :text

  def initialize(id:, username:, peep_time:, text:)
    @username = username
    @peep_time = peep_time
    @text = text
    @id = id
  end

  # TODO make non-text specific

  def self.all
    con = connection
    data = con.exec("SELECT * FROM peeps ORDER BY peep_time DESC")
    data.map do |chitter|
      Chitter.new(id: chitter['id'],
                  username: chitter['username'],
                  peep_time: chitter['peep_time'],
                  text: chitter['text'])
    end
  end

  def self.connection
    return PG.connect(dbname: 'chitter_manager_test') if ENV['R ENV'] == 'test'
    PG.connect(dbname: 'chitter_manager')
  end

# TODO add in peep_time

  def self.add(username:, peep_time:, text:)
    con = connection
    con.exec("INSERT INTO peeps (username, text, peep_time)
            VALUES ('#{username}', '#{text}', '#{peep_time}')
            RETURNING id, username, peep_time, text")
  end

end
