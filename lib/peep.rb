# peep.rb
class Peep

  attr_reader :text, :time, :username, :name

  def initialize(text, time, username = nil, name = nil)
    @text = text
    @time = time
    @username = username
    @name = name
  end

  def self.create(peep:, user_id:)
    time = format_time
    sqlquery = "INSERT INTO peeps(text, time, user_id) VALUES('#{peep}', '#{time}', '#{user_id}') RETURNING text, time;"
    result = DatabaseConnection.query(sqlquery)
    Peep.new(result[0]['text'], result[0]['time'])
  end

  def self.all
    sqlquery = "SELECT text, time, username, name FROM peeps JOIN users ON peeps.user_id=users.id"
    result = DatabaseConnection.query(sqlquery)
    result.map { |peep| Peep.new(peep['text'], peep['time'], peep['username'], peep['name']) }.reverse!
  end

  private_class_method

  def self.format_time
    Time.now.strftime("%I:%M%p on %m/%d/%Y")
  end

end
