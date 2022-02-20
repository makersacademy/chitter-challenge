require "pg"
require "time"
require_relative './database_connection'

class Peep

  attr_reader :id, :peep, :created_at, :user_id, :user

  def initialize(id:, peep:, created_at:, user_id:)
    @id = id
    @peep = peep
    @created_at = created_at
    @user_id = user_id
    if user_id != nil
      @user = get_user(user_id) 
    end
  end

  def get_user(user_id, user_class = User)
    user_class.find(id: user_id)
  end

  def self.create(peep:, user_id:)
    return nil if peep.empty?
    cleaned_peep = DatabaseConnection.escape_string(peep)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (peep, user_id)
      VALUES ('#{cleaned_peep}', #{user_id})
      RETURNING id, peep, created_at, user_id;"
    )
    Peep.new(
      id: result[0]["id"],
      peep: result[0]["peep"],
      created_at: result[0]['created_at'],
      user_id: peep['user_id']
    )
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at DESC;")
    list = result.map do |peep|
      epoch = Time.parse(peep["created_at"]).to_i
      date = Time.at(epoch).strftime("%e %b %Y at %H:%M")
      Peep.new(
        id: peep["id"],
        peep: peep["peep"],
        created_at: date,
        user_id: peep["user_id"]
      )
    end
  end

end
