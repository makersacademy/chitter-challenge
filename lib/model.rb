require 'pg'

class ChitterHandler
  DEFAULT_PEEPS = [
    "The first peep on Chitter!",
    "Coming up with fun examples is HARD..."
  ]

  class << self
    attr_reader :signed_in_user

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
      query = "INSERT INTO peeps (text, username) VALUES('#{message}', '#{user}')"
      select_connection.exec query
    end

    def create_user(username:, email:, name:, password:)
      query = "INSERT INTO users VALUES('#{username}', '#{email}', '#{name}', '#{password}')"
      select_connection.exec query
      @signed_in_user = find_user(username: username)
    end

    def find_user(username:)
      query = "SELECT * FROM users WHERE username = '#{username}'"
      select_connection.exec(query).map do |user|
        { username: user['username'],
          email: user['email'],
          name: user['name'],
          password: user['password']
        }
      end .first
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
