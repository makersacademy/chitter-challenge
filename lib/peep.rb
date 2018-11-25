require './database_connection_setup'

class Peep
  attr_reader :id, :user_id, :time, :content

  def initialize(id:, user_id:, time_stamp:, content:)
    @id = id
    @user_id = user_id
    @time = time_diff(time_stamp)
    @content = content
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")

    result.map { |peep| Peep.new(id: peep['id'], user_id: peep['user_id'], time_stamp: peep['time_stamp'], content: peep['peep']) }
  end

  def self.create(user_id:, content:)
    result = DatabaseConnection.query("INSERT INTO peeps (user_id, peep) VALUES('#{user_id}', '#{content}') RETURNING id, user_id, time_stamp, peep")

    Peep.new(id: result[0]['id'], user_id: result[0]['user_id'], time_stamp: result[0]['time_stamp'], content: result[0]['peep'])
  end

  private

  def time_diff(time)
    diff = Time.now - Time.parse(time)
    s = "s"
    s = "" if (diff.round == 1 || diff.round == 60 || diff.round == 3600 || diff.round == 86400)
    case diff
    when 0...60
      "#{diff.round} second#{s} ago"
    when 60...3600
      "#{(diff/60).round} minute#{s} ago"
    when 3600...86400
      "#{(diff/3600).round} hour#{s} ago"
    else
      "#{(diff/86400).round} day#{s} ago"
    end
  end
end
