require_relative 'reply'
require_relative 'database_connection'

DatabaseConnection.connect

class ReplyRepository

  def all

    replies = []

    sql = 'SELECT id, username, content, datetime, peep_id FROM replies;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|

      reply = Reply.new
      reply.id = record['id'].to_i
      reply.username = record['username']
      reply.content = record['content']
      reply.datetime = record['datetime']
      reply.peep_id = record['peep_id']

      replies << reply
    end

    return replies

  end

  def ids(id)

    replies = []

    sql = 'SELECT id, username, content, datetime, peep_id FROM replies WHERE peep_id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    result_set.each do |record|

      reply = Reply.new
      reply.id = record['id'].to_i
      reply.username = record['username']
      reply.content = record['content']
      reply.datetime = record['datetime']
      reply.peep_id = record['peep_id']

      replies << reply
    end

    return replies

  end

  def create(reply)
    sql = 'INSERT INTO replies (username, content, datetime, peep_id) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [reply.username, reply.content, reply.datetime, reply.peep_id])

    return reply
  end

  def find_ids

    ids = []
    sql = 'SELECT id, username, content, datetime, peep_id FROM replies;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|

      ids << record['peep_id'].to_i

    end

    return ids

  end
end
