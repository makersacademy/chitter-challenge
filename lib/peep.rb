require 'pg'

class Peep
  attr_reader :id, :text, :username, :time

  def initialize(id, text, time, username)
    @id = id
    @text = text
    @username = username
    @time = Time.new.strftime('%I:%M %p on %A, %B %C %Y')
  end

  def ==(other)
   @id = other.id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['id'], peep['text'], peep['time'], peep['username']) }

  end

  def self.create(options)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    return false unless exceed_character_length?(options[:text])
    result = connection.exec("INSERT INTO peeps (text, username) VALUES('#{options[:text]}', '#{options[:username]}') RETURNING id, text, time, username")
    Peep.new(result.first['id'], result.first['text'], result.first['time'], result.first['username'])
  end

  def self.delete(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    connection.exec("DELETE FROM peeps WHERE id = #{:id}")
  end

  def self.edit(options)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("UPDATE peep SET url=('#{options[:text]}'),title=('#{options[:username]}') WHERE id=('#{options[:id]}')")
  end

  def self.exceed_character_length?(text)
    text.length <= 280
  end
end
