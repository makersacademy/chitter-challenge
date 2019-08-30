require 'time'

class Peep
  def self.create(content, user_id)
    sql = %q{INSERT INTO peeps (content, peep_time, user_id) VALUES ($1, $2, $3) RETURNING *;}
    rs = DatabaseConnection.query(sql, [content, Time.now, user_id])
    # rs = DatabaseConnection.query("INSERT INTO peeps (content, peep_time, user_id) VALUES ('#{content}', '#{Time.now}', '#{user_id}') RETURNING *;")
    Peep.new(rs[0]['id'], rs[0]['content'], rs[0]['peep_time'], rs[0]['user_id'])
  end

  def self.all
    rs = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC;")
    rs.map { |peep|
      Peep.new(peep['id'], peep['content'], peep['peep_time'], peep['user_id'])
    }
  end

  attr_reader :id, :content, :peep_time, :user_id

  def initialize(id, content, peep_time, user_id)
    @id = id
    @content = content
    @peep_time = peep_time
    @user_id = user_id
  end
end
