require 'pg'

class Peep
  attr_reader :username, :name, :created_at, :peep 

  def initialize(username:, name:, created_at:, peep:)
    @username = username
    @name = name
    @created_at = created_at
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else 
      connection = PG.connect(dbname: 'chitter_manager')
    end 
    
    result = connection.exec("SELECT users.username, users.name, peeps.peep, peeps.created_at FROM peeps LEFT JOIN users ON users.id = peeps.user_id ORDER BY created_at DESC;")
    result.map do |peep| 
      Peep.new(username: peep['username'], name: peep['name'], created_at: peep['created_at'], peep: peep['peep'])
    end
  end 

end 
