RSpec.configure do |config|
  config.before(:each) do
    begin
      connection = PG.connect :dbname => "demo_bookmark_manager_# {ENV['RACK_ENV'] }"
      connection.exec("TRUNCATE TABLE bookmarks")
    rescue PG::Error => if e
      puts e.message
    ensure
      connection.close if connection
    end
  end
end