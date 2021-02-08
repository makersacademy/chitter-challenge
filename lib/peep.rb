require 'pg'
require './lib/database_connection'

class Peep
  attr_reader :peep_id, :created_at, :peep_content, :peep_user_id

  def initialize(peep_id:, created_at:, peep_content:, peep_user_id:)
    @peep_id = peep_id
    @created_at = created_at
    @peep_content = peep_content
    @peep_user_id = peep_user_id
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at DESC;")
    peeps.map do |peep|
      Peep.new(
        peep_id: peep['peep_id'],
        created_at: peep['created_at'],
        peep_content: peep['peep_content'],
        peep_user_id: peep['peep_user_id']
      )
  end
end

  def self.create(peep_content:, peep_user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep_content, peep_user_id) VALUES ('#{peep_content}', '#{peep_user_id}') RETURNING peep_id, created_at, peep_content, peep_user_id;")
    Peep.new(
      peep_id: result[0]['peep_id'], 
      created_at: result[0]['created_at'], 
      peep_content: result[0]['peep_content'], 
      peep_user_id: result[0]['peep_user_id']
      )
  end

end
