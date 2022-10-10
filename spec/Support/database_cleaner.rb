require 'pg'

RSpec.configure do |config|
  config.before(:each) do
    #Reset tests
    begin
      connection = PG.connect :dbname => 'chitter_test'
      connection.exec("TRUNCATE TABLE peeps, users")

    rescue PG::Error => e
      puts e.message
    ensure
      connection.close if connection
    end
  end
end