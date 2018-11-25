require 'chitter'
require 'database_helpers'

describe Peep do
  it 'shows a list of all the peeps' do
    PG.connect(dbname: 'chitter_test').query("INSERT INTO peeps (message,username_id) VALUES ('miao','lucaf');")
    result = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps")

    result.map do |peep|
      Peep.new(id: peep['id'], username: peep['username_id'], time: peep['time'], message: peep['message'])
    end
  end

  it 'creates a new peep' do
    PG.connect(dbname: 'chitter_test').query("INSERT INTO peeps (message,username_id) VALUES ('miao','lucaf');")
  end
end
