require 'pg'

class DatabaseSetup
  attr_reader :connection
  def self.setup
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end
  end
end
