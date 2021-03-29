class Messages

  def self.add(new_entry)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test' )
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO messages (content) VALUES('#{new_entry}');")
  end

end
