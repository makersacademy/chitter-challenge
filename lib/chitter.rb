require 'pg'
require 'byebug'

class Chitter

  attr_reader :id, :peep, :created_at, :user_id

  def initialize(id:, peep:, created_at:, user_id:)
    @id = id
    @peep = peep
    @created_at = created_at
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM chitters;")
    result.map do |chitter|
      Chitter.new(
        id: chitter['id'],
        peep: chitter['peep'],
        created_at: chitter['created_at'],
        user_id: chitter['user_id']
      )
    end
  end
  
  def self.create(peep, user_id)
    result = DatabaseConnection.query(
"INSERT INTO chitters (peep, user_id) VALUES($1, $2) RETURNING id, peep, created_at, user_id;", [
  peep, user_id])
    Chitter.new(
      id: result[0]['id'],
      peep: result[0]['peep'],
      created_at: result[0]['created_at'],
      user_id: result[0]['user_id']
    )
  end
end
