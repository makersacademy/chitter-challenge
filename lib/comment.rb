require_relative './peeps'

class Comment

  attr_reader :id, :text, :peep_id, :user_id

  def initialize(id:, text:, peep_id:, user_id:)
    @id = id
    @text = text
    @peep_id = peep_id
    @user_id = user_id
  end


  def self.list
    Database.query( "SELECT * FROM comments" ).map do | row |
      Comment.new(id: row['id'], text: row['text'], peep_id: row['peep_id'], user_id: row['user_id'])
    end
  end

  def self.add(text:, peep_id:, user_id:)
    result = Database.query( "INSERT INTO comments(text, peep_id, user_id) VALUES('#{text}', '#{peep_id}', '#{user_id}') RETURNING id, text, peep_id, user_id")
    Comment.new(id: result[0]['id'], text: result[0]['text'], peep_id: result[0]['peep_id'], user_id: result[0]['user_id'])
  end 

end
