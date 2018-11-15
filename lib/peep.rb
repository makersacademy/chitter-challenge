require 'pg'

class Peep

  attr_reader :id, :text, :time, :user_id, :email

  def initialize(id:, text:, time:, user_id:, email: nil)
    @id = id
    @text = text
    @time = time
    @user_id = user_id
    @email = email
  end

  def self.all
    result = DatabaseConnection.query(
      "SELECT peeps.id, text, time, user_id, email FROM peeps JOIN users 
       ON peeps.user_id = users.id
       ORDER BY time;")
    result.map do |peep|
      Peep.new(id: peep['id'], 
               text: peep["text"], 
               time: peep["time"],
               user_id: peep["user_id"],
               email: peep['email'])
    end.reverse
  end

  def self.create(text:, user_id:)
    time = format_time
    result = DatabaseConnection.query(
      "INSERT INTO peeps (text, time, user_id) 
       VALUES ('#{text}', '#{time}', '#{user_id}') 
       RETURNING id, text, time, user_id;")
    Peep.new(
      id: result[0]['id'], 
      text: result[0]['text'], 
      time: result[0]['time'],
      user_id: result[0]['user_id'])
  end

  def self.delete(id:)
    DatabaseConnection.query(
      "DELETE FROM peeps 
       WHERE id = #{id}")
  end

  def self.update(id:, text:)
    result = DatabaseConnection.query(
      "UPDATE peeps 
       SET text='#{text}' 
       WHERE id='#{id}' 
       RETURNING id, text;")
    Peep.new(
      id: result[0]['id'], 
      text: result[0]['text'], 
      time: result[0]['time'],
      user_id: result[0]['user_id'])
  end

  def self.find(id:)
    result = DatabaseConnection.query(
      "SELECT * 
       FROM peeps 
       WHERE id = #{id};")
    Peep.new(
      id: result[0]['id'], 
      text: result[0]['text'], 
      time: result[0]['time'],
      user_id: result[0]['user_id'])
  end

  def comments(comment_class = Comment)
    comment_class.where(peep_id: id)
  end 

  def self.format_time
    Time.now.strftime("%I:%M%P on %m/%d/%Y")
  end

  private_class_method :format_time

end
