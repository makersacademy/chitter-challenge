require 'pg'

class Peeps

  attr_reader :id, :user_name, :peep

  def initialize(id:, user_name:, peep:)
    @id = id
    @user_name = user_name
    @peep = peep
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY id ASC;")
    result.map { |peep| Peeps.new(id: peep['id'], user_name: peep['user_name'], peep: peep['peep'])}
  end
end