require 'pg'

class Chitter

  attr_reader :user_name, :peep
  
  def initialize(user_name:, peep:)
    @user_name = user_name
    @peep = peep
  end

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

  def self.all
    connection = Chitter.connect
    result_peeps = connection.exec( "SELECT * FROM peeps INNER JOIN users ON (peeps.user_id = users.id);" )

    # issue atm is need db talking to each other and mapping
    result_peeps.map do |peep|
     Chitter.new(user_name: peep['user_name'], peep: peep['peep']) 
    end
  end

  def self.new_peep(user_name, peep, user_id = 1)
    connection = Chitter.connect
    result = connection.exec( "INSERT INTO users (user_name) VALUES('#{user_name}')" )
    # work out how to automatically use foreign key values here - might need to extract somehow
    # assign something to user_id
    result = connection.exec( "INSERT INTO peeps (user_id, peep) VALUES('#{user_id}', '#{peep}')" )
  end
end