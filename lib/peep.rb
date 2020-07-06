class Peep
  def self.all
  end
  
  def self.create(body:, user:)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps (body, user) VALUES('#{body}', '#{user}')")
  end
end