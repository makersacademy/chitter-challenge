require 'pg'

module Database

  class Connection
    def self.create
      if ENV['ENVIRONMENT'] == 'test'
        PG.connect(dbname: "chitter_test")
      else
        PG.connect(dbname: "chitter")
      end
    end
  end
end
