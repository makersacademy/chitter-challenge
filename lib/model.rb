require 'pg'

class ChitterHandler
  DEFAULT_PEEPS = [
    "The first peep on Chitter!",
    "Coming up with fun examples is HARD..."
  ]

  class << self
    def retrieve_peeps
      query = "SELECT * FROM peeps ORDER BY date_and_time_posted"
      select_connection.exec(query).map do |peep|
        { id: peep['id'],
          text: peep['text'],
          datetime: peep['date_and_time_posted'],
          username: peep['username']
        }
      end
    end

    def add_peep(message, user = nil)
      message.gsub! "'", "''"
      user.gsub! "'", "''" if user
      select_connection.exec \
        "INSERT INTO peeps (text, username) VALUES('#{message}', '#{user}')"
    end

    private

    def select_connection
      if ENV['RACK_ENV'] == 'test'
        PG.connect :dbname => 'chitter_test'
      else
        PG.connect :dbname => 'chitter'
      end
    end
  end
end
