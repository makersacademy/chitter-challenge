require './lib/tag_verification_service'
require './lib/message_service'

class Peep 

  attr_reader :user_id, :peep, :timestamp

  def initialize(user_id:, peep:, timestamp:)
    @user_id = user_id
    @peep = peep
    @timestamp = timestamp
  end

  def self.create(user_id:, peep:, email: Email, tag_service: TagService)

    sql = "INSERT INTO peeps (user_id, peep) VALUES ('#{user_id}', '#{peep}') RETURNING id, user_id, peep, peep_time"
    result = DatabaseConnection.query(sql).first

    email.send if tag_service.check(peep: result['peep'])

    Peep.new(user_id: result['user_id'], peep: result['peep'], timestamp: result['peep_time'])
  end

  def self.all
    sql = "SELECT users.name, users.username, peeps.peep, peeps.peep_time FROM peeps JOIN users ON peeps.user_id = users.id ORDER BY peeps.peep_time DESC "
    result = DatabaseConnection.query(sql)
  end

end