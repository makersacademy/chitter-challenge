require 'pg'
require './lib/database_connection'

class Peep
  attr_reader :id, :created_at, :peep_content, :user_id

  def initialize(id:, created_at:, peep_content:, user_id:)
    @id = id
    @created_at = created_at
    @peep_content = peep_content
    @user_id = user_id
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at DESC;")
    peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        created_at: peep['created_at'],
        peep_content: peep['peep_content'],
        user_id: peep['user_id']
      )
  end
end

  def self.create(peep_content:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep_content) VALUES ('#{peep_content}') RETURNING id, created_at, peep_content, user_id;")
    Peep.new(
      id: result[0]['id'], 
      created_at: result[0]['created_at'], 
      peep_content: result[0]['peep_content'], 
      user_id: result[0]['user_id']
      )
  end

end
