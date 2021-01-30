require 'pg'
require './lib/database_connection'

class Peep
  attr_reader :peep_id, :created_at, :peep_content, :user_name

  def initialize(peep_id:, created_at:, peep_content:, user_name:)
    @peep_id = peep_id
    @created_at = created_at
    @peep_content = peep_content
    @user_name = user_name
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps;")
    peeps.map do |peep|
      Peep.new(
        peep_id: peep['peep_id'],
        created_at: peep['created_at'],
        peep_content: peep['peep_content'],
        user_name: peep['user_name']
      )
  end
end

  def self.create(peep_content:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep_content) VALUES('#{peep_content}) RETURNING peep_id, created_at, peep_content, user_name;")
    Peep.new(peep_id: result[0]['peep_id'], created_at: result[0]['created_at'], peep_content: result[0]['peep_content'], user_name: result[0]['user_name'])
  end

end
