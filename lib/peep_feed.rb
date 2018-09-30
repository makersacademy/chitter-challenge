require_relative 'peep'
require_relative 'database_connection'

class PeepFeed
  def initialize(connection: DatabaseConnection, mailer: nil,
                 peep_type: Peep)
    @connection = connection
    @mailer = mailer
    @peep_type = peep_type
  end

  def post_peep(user, peep_text)
    user_id = user.user_details[:id]
    peep_text = peep_text.gsub("'", "''")
    @connection.query('INSERT INTO peeps(contents, user_id, timestamp) '\
      "VALUES('#{peep_text}', #{user_id}, NOW());")
  end

  def top_peeps(number)
    query_results = @connection.query('SELECT peeps.id, peeps.contents, '\
      'peeps.timestamp, users.username FROM peeps INNER JOIN users ON '\
      "peeps.user_id = users.id ORDER BY peeps.timestamp DESC LIMIT #{number}")
    query_results.map do |hash|
      @peep_type.new(hash[:id], hash[:username], hash[:contents],
                     hash[:timestamp])
    end
  end

  def get_peep(peep_id)
    result = @connection.query('SELECT peeps.contents, peeps.timestamp,'\
      ' users.username FROM peeps INNER JOIN users ON peeps.user_id = users.id'\
      " WHERE peeps.id = #{peep_id};")[0]
    @peep_type.new(peep_id, result[:username], result[:contents],
                   result[:timestamp])
  end

  def reply_peep(user, peep_text, reply_to)
    post_peep(user, peep_text)
    peep_id = @connection.query('SELECT id FROM peeps WHERE user_id = '\
      "#{user.user_details[:id].to_i} ORDER BY id DESC LIMIT 1;")[0][:id].to_i
    @connection.query('INSERT INTO replies(original_id, reply_id) VALUES('\
      "#{reply_to.to_i}, #{peep_id});")
  end
end
