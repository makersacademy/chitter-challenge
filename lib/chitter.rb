require_relative '../lib/chitter'
require_relative '../lib/user'
require 'pg'
require 'date'

class Chitter
  attr_reader :chitter_id, :user_id, :peep, :date

  def initialize(chitter_id:, user_id:, peep:, date:)
    @chitter_id = chitter_id
    @user_id = user_id
    @peep = peep
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec(' SELECT chitter_id, user_id, peep, DATE FROM chitter ORDER BY DATE DESC;')
    # result.map do |peep|
    #   Chitter.new(chitter_id: peep['chitter_id'], user_id: peep['user_id'], peep: peep['peep'], date: peep['date'])
    # end
   chitters = []
  result.each do |peep|
    Chitter.new(chitter_id: peep['chitter_id'], user_id: peep['user_id'], peep: peep['peep'], date: peep['date'])
    chitter = []
    chitter[0] = peep['peep']
    chitter[1] = peep['date'][0,19]
    user_id =  peep['user_id']
    results = connection.exec_params(
        "SELECT  user_name FROM user_chitter WHERE id = '#{user_id}'"
      )
    
    user_name =""
    results.map do |username|
      user_name = (username['user_name'])
    end
    chitter[2] = user_name
    chitters.push(chitter)
  end
  chitters
end

  def self.create(peep:, user_email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end 
    connection.exec("INSERT INTO chitter (user_id, peep, DATE)  select id, ('#{peep}') , NOW() from user_chitter where user_email = ('#{user_email}');")
  end

end
