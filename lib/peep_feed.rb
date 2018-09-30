require_relative 'peep'
require_relative 'database_connection'

class PeepFeed
  def initialize(connection: DatabaseConnection.new, mailer: nil,
                 peep_type: Peep)
    @connection = connection
    @mailer = mailer
    @peep_type = peep_type
  end

  def post_peep(user, peep_text, tags = nil)
    user_id = user.user_details[:id]
    peep_text = peep_text.gsub("'", "''")
    peep_tagging(user_id, peep_text)
    @connection.query('INSERT INTO peeps(contents, user_id, timestamp) '\
      "VALUES('#{peep_text}', #{user_id}, NOW());")
  end

  def top_peeps(number)
    query_results = @connection.query('SELECT peeps.contents, peeps.timestamp,'\
      ' users.username FROM peeps INNER JOIN users ON peeps.user_id = users.id'\
      " ORDER BY peeps.timestamp DESC LIMIT #{number}")
    query_results.map do |hash|
      @peep_type.new(hash[:username], hash[:contents], hash[:timestamp])
    end
  end

  def get_peep(peep_id)
    result = @connection.query('SELECT peeps.contents, peeps.timestamp,'\
      ' users.username FROM peeps INNER JOIN users ON peeps.user_id = users.id'\
      " WHERE peeps.id = #{peep_id}")[0]
    @peep_type.new(result[:username], result[:contents], result[:timestamp])
  end

  def peep_tagging(user_id, peep_text)
  end
end
