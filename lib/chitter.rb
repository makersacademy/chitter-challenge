require 'pg'

class Chitters
  attr_reader :id, :peep, :user_name

  def initialize(id:, peep:, user_name:)
    @id = id
    @peep = peep
    @user_name = user_name
  end
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("SELECT * FROM chitter;")
    result.map { |chitter| chitter['peep'] }
  end
end
