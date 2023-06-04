require_relative '../models/reply'


class ReplyRepository
  def self.create(content, user_id, peep_id)
    timestamp = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    query = "INSERT INTO replies (content, timestamp, user_id, peep_id) VALUES ($1, $2, $3, $4) RETURNING id;"
    result = DatabaseConnection.exec_params(query, [content, timestamp, user_id, peep_id])
    id = result[0]['id'].to_i
    Reply.new(id: id, content: content, timestamp: timestamp, user_id: user_id, peep_id: peep_id)
  end

  def self.find_by_id(id)
    query = "SELECT * FROM replies WHERE id = $1;"
    result = DatabaseConnection.exec_params(query, [id])
    build_reply(result[0]) if result.any?
  end

  def self.update(id, content)
    query = "UPDATE replies SET content = $1 WHERE id = $2;"
    DatabaseConnection.exec_params(query, [content, id])
  end

  def self.delete(id)
    query = "DELETE FROM replies WHERE id = $1;"
    DatabaseConnection.exec_params(query, [id])
  end

  def self.find_by_peep(peep_id)
    query = "SELECT * FROM replies WHERE peep_id = $1;"
    result = DatabaseConnection.exec_params(query, [peep_id])
    build_replies(result)
  end

  private

  def self.build_reply(result)
    id = result['id'].to_i
    content = result['content']
    timestamp = result['timestamp']
    user_id = result['user_id'].to_i
    peep_id = result['peep_id'].to_i
    Reply.new(id: id, content: content, timestamp: timestamp, user_id: user_id, peep_id: peep_id)
  end

  def self.build_replies(results)
    replies = []
    results.each do |result|
      replies << build_reply(result)
    end
    replies
  end
end
