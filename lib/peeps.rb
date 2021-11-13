# frozen_string_literal: true

require 'pg'

# Manages the peeps database
class Peeps
  class << self
    def all
      connection.exec('SELECT * FROM peeps')
    end

    private

    def connection
      PG.connect(dbname: "chitter_zimmja#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
    end
  end
end
