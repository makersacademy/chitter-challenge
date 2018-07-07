require 'pg'

module Database

  class Connection
    def self.create
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: "chitter_test")
      else
        connection = PG.connect(dbname: "chitter")
      end
    end
  end
end
