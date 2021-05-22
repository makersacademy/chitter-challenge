class Peep
  def self.all
    [
      "This is my first peep!",
      "This is my second peep!",
      "This is my third peep!"
     ]
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_app_test')
      else
        connection = PG.connect(dbname: 'chitter_app')
      end

      connection.exec("INSERT INTO peeps (content) VALUES('#{content}')")
  end 
end 