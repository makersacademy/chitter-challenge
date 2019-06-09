require 'pg'
require './lib/peep'
require './lib/user'

class ChitterFeed

  def self.add(message, user_id = 1, time = Time.new)
   set_database
    @con.exec("INSERT INTO messages (content, postedat, userid) VALUES ('#{message}', '#{time}', #{user_id});")
  end
        
  def self.view
    set_database
    feed_data = @con.exec("SELECT * FROM messages")
    feed_data.map { |message| Peep.new(message['id'], message['content'], message['postedat'], message['userid']) }
  end

  def self.login
  end

  def self.logout
  end

  private 

  def self.set_database
    @con = if ENV['ENVIRONMENT'] == 'test'
            PG.connect(dbname: 'chitter_test')
           else
            PG.connect(dbname: 'chitter')
           end
  end
end