require 'pg'

class Peep

  attr_reader :id, :peep, :peep_created, :created_time, :user_id

  def initialize(id:, peep:, peep_created:, created_time:, user_id:)
    @id = id
    @peep = peep
    @peep_created = peep_created
    @created_time = created_time
    @user_id = user_id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec(
     "SELECT id, peep, peep_created, TO_CHAR(peep_created, 'HH12:MIPM DD-MON-YYYY') created_time, user_id 
     FROM peeps ORDER by peep_created DESC;")
    result.map do |peep| 
      Peep.new(id: peep['id'], peep: peep['peep'], peep_created: peep['peep_created'], 
created_time: peep['created_time'], user_id: peep['user_id'])
    end
  end

  def self.create(peep:, user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec(
     "INSERT INTO peeps (peep, user_id) 
     VALUES('#{peep}', '#{user_id}') 
     RETURNING id, peep, peep_created, created_time, user_id;").first
    Peep.new(id: result['id'], peep: result['peep'], peep_created: result['peep_created'], 
created_time: result['created_time'], user_id: result['user_id'])
  end
end
