require 'pg'

class Peeps

  attr_reader :id, :peep, :time, :user_id

  def initialize(id:, peep:, time:, user_id:)
    @id = id
    @peep = peep
    @time = time
    @user_id = user_id
  end

  def self.create(peep:, user_id:)
    return nil unless peep
    result = DatabaseConnection.query("INSERT INTO peeps (peep, user_id) VALUES('#{peep}', '#{user_id}') RETURNING id, peep, time, user_id;").first
    Peeps.new(id: result["id"], peep: result["peep"], time: Time.parse(result["time"]), user_id: result['user_id'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id desc;")
    result.map do |peep|
      Peeps.new(id: peep['id'], peep: peep['peep'], time: Time.parse(peep['time']), user_id: peep['user_id'])
    end
  end

  def find_username
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{user_id};")[0]['username']
  end
end
