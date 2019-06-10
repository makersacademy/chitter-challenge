require 'pg'

class Username
  attr_reader :id, :name,
  
  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.create(name)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_manager_test')
                 else
                   PG.connect(dbname: 'chitter_manager')
                 end
    connection.exec("INSERT INTO users (name) VALUES('#{name}');")
  end

end
