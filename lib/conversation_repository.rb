require_relative 'conversation'

class ConversationRepository

  def all

    conversations = []

    sql = 'SELECT id, maker_id FROM conversations;'
    result_set = DatabaseConnection.exec_params(sql,[])
    result_set.each do |record|
      conversation = Conversation.new
      conversation.id = record['id'].to_i
      conversation.maker_id = record['maker_id'].to_i
      conversations << conversation
    end
    return conversations
  end

  def create(conversation)

    sql = 'INSERT INTO conversations (maker_id) VALUES ($1);'
    params = [conversation.maker_id]
    DatabaseConnection.exec_params(sql,params)
    return nil
  end

  def find(id)
    sql = 'SELECT id, maker_id FROM conversations WHERE id = $1;'
    params = [id]
    record = DatabaseConnection.exec_params(sql,params).first
    conversation = Conversation.new
    conversation.id = record['id'].to_i
    conversation.maker_id = record['maker_id'].to_i
    return conversation
  end

  def delete(id)
    sql = 'DELETE FROM conversations WHERE id = $1;'
    params = [id]
    DatabaseConnection.exec_params(sql,params)
  end

end
