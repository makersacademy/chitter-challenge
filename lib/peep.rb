require 'pg'

class Peep

  attr_reader :account_id, :script, :created_at, :peep_id

  def initialize(script:, created_at:, account_id:, peep_id:)
    @account_id = account_id
    @script = script
    @created_at = created_at
    @peep_id = peep_id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end

    result = connection.exec('SELECT * FROM peeps;')

    result.map do |peep|

      Peep.new(script: peep['script'], created_at: peep['created_at'], account_id: peep['account_id'], peep_id: peep['peep_id'])
    end

  end

  def self.create(script:, created_at:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end

    result = connection.exec("INSERT INTO peeps (script,created_at,account_id) VALUES ('#{script}','#{created_at}',(SELECT account_id FROM accounts WHERE username='Guest')) RETURNING account_id, script, created_at, peep_id;")
    Peep.new(script: result[0]['script'], created_at: result[0]['created_at'], account_id: result[0]['account_id'], peep_id: result[0]['peep_id'])
  end
end
