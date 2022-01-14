require 'pg'

class Peep
  def self.all
    connect

    ['Test peep 1', 'Test peep 2', 'Test peep 3']
  end

  private

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end
end
