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
    p result_peeps
    result_peeps.map do |peep|
     Chitter.new(user_name: peep['user_name'], peep: peep['peep']) 
    end
  end

  def self.new_peep(user_name, peep)
    connection = Chitter.connect
    result = connection.exec( "INSERT INTO users (user_name) VALUES('#{user_name}')" )
    user_id = connection.exec( "SELECT id FROM users WHERE user_name= '#{user_name}'" )
    # check if user exists, add user and id, if not, get id
    # work out how to automatically use foreign key values here ? - currently manually extracting
    result = connection.exec( "INSERT INTO peeps (user_id, peep) VALUES('#{user_id.getvalue(0,0)}', '#{peep}')" )
  end
end