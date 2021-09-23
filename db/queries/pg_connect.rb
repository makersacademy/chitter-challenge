require 'dotenv'
require_relative './pg_db'

module DB
  def self.connect
    Dotenv.load
    if ENV['ENVIRONMENT'] == 'test'
      PGDatabase.make_connection('chitter_test')
    else
      PGDatabase.make_connection('chitter')
    end
  end
end
