require 'pg'

class Peep

  attr_reader :id, :text, :time

  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end

  def self.all
    result = DatabaseConnection.query(
      "SELECT * 
       FROM peeps")
    result.map do |peep|
      Peep.new(
        id: peep["id"], 
        text: peep["text"], 
        time: peep["time"])
    end.reverse
  end

  def self.create(text:)
    time = format_time
    result = DatabaseConnection.query(
      "INSERT INTO peeps (text, time) 
       VALUES ('#{text}', '#{time}') 
       RETURNING id, text, time;")
    Peep.new(
      id: result[0]['id'], 
      text: result[0]['text'], 
      time: result[0]['time'])
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
      time: result[0]['time'])
  end

  def self.find(id:)
    result = DatabaseConnection.query(
      "SELECT * 
       FROM peeps 
       WHERE id = #{id};")
    Peep.new(
      id: result[0]['id'], 
      text: result[0]['text'], 
      time: result[0]['time'])
  end

  def comments(comment_class = Comment)
    comment_class.where(peep_id: id)
  end 

  def self.format_time
    Time.now.strftime("%I:%M%P on %m/%d/%Y")
  end

  private_class_method :format_time

end
