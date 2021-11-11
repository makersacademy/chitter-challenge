class Bookmark
   def self.all
    begin
      connection = PG.connect :dbname => "demo_bookmark_manager_# {ENV['RACK_ENV']}"
      result = connection.exec("SELECT * FROM bookmarks;")
      result.map do |row|
        new(id: row[:id], url: row[:url])
      end
    rescue PG::Error => e
      puts e.message
    ensure
      connection.close if connection
    end
  end 

   attr_reader :id, :url
   def initialize(id:, url:)
    @id = id
    @url = url
  end
end 