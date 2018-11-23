require 'pg'

class ChitterHandler
  DEFAULT_PEEPS = [
    "The first peep on Chitter!",
    "Coming up with fun examples is HARD..."
  ]

  class << self
    def retrieve_peeps
      select_connection.exec("SELECT * FROM peeps").each.to_a
    end

    def add_peep(message)
      message.gsub! "'", "''"
      select_connection.exec "INSERT INTO peeps (text) VALUES('#{message}')"
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
