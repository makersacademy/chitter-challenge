require 'time'

class Peep

  attr_reader :id, :content, :time, :user_id

  def initialize(id, content, time, user_id)
    @id = id
    @content = content
    @time = time
    @user_id = user_id
  end

  def self.create(content, user_id)
    time = Time.now.strftime("%H:%M:%S %d %b %Y")
    result = DatabaseConnection.query("INSERT INTO peeps (content, time, user_id)
                                       VALUES($1, $2, $3)
                                       RETURNING id, content, time, user_id;", [content, time, user_id])
    Peep.new(result[0]["id"], result[0]["content"], result[0]["time"], result[0]["user_id"])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map {|peep| Peep.new(peep["id"], peep["content"], peep["time"], peep["user_id"])}
  end

  def self.sort_peeps(peeps = Peep.all)
    peeps.sort_by { |peep| Time.parse(peep.time)}.reverse
  end

end