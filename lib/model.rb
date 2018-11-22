require 'pg'

class ChitterHandler
  @connection = PG.connect :dbname => 'chitter'

  DEFAULT_PEEPS = [
    "The first peep on Chitter!",
    "Coming up with fun examples is HARD..."
  ]

  class << self
    def retrieve_peeps
      @connection.exec("SELECT * FROM peeps").each.to_a
    end
  end
end
