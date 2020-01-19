require 'pg'

class Peep

  attr_reader :id, :user_name, :user_handle, :peep

  def initialize(id:, user_name:, user_handle:, peep:)
    @id = id
    @user_name = user_name
    @user_handle = user_handle
    @peep = peep
  end

  def self.see_all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], user_name: peep['user_name'],
        user_handle: peep['user_handle'], peep: peep['peep'])
    end
  end


  def self.create(user_name:, user_handle:, peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end

    result = connection.exec("INSERT INTO peeps (user_name, user_handle, peep) VALUES ('#{user_name}', '#{user_handle}', '#{peep}') RETURNING id, user_name, user_handle, peep")
    Peep.new(id: result[0]['id'], user_name: result[0]['user_name'], user_handle: result[0]['user_handle'], peep: result[0]['peep'])
  end

end
