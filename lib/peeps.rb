require 'pg'

class Peeps

    def self.new_peep(name:, username:, message:)
      if ENV['ENVIRONMENT']= 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end
        p connection.exec("INSERT INTO peeps (name, username, message) VALUES('#{name}', '#{username}', '#{message}') RETURNING id, name, username, message, time;")
    end

    def self.view_peeps
    end
end