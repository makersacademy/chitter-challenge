require 'pg'

class Peeps 
  attr_reader :peep_id, :account_id, :message, :created_at, :updated_at

  def initialize(peep_id:, account_id:, message:, created_at:, updated_at:)
    @peep_id = peep_id
    @account_id = account_id
    @message = message
    @created_at = created_at
    @updated_at = updated_at
  end 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end

    result = conn.exec_params("SELECT * FROM peeps")
    result.map do |peep| 
      Peeps.new(peep_id: peep['peep_id'], account_id: peep['account_id'], 
        message: peep['message'], created_at: peep['created_at'], updated_at: peep['updated_at'])
    end 
  end 

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    result = conn.exec_params("INSERT INTO peeps (message) VALUES('#{message}') 
       RETURNING peep_id, account_id, message, created_at, updated_at;")
    Peeps.new(peep_id: result[0]['peep_id'], account_id: result[0]['account_id'],
       message: result[0]['message'], created_at: result[0]['created_at'], 
       updated_at: result[0]['updated_at'])
  end 
end 
