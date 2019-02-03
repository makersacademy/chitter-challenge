class Peep
  attr_reader :id, :text, :time, :user_id

  def initialize(id:, text:, time:, user_id:)
    @id = id
    @text = text
    @time = time
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'], user_id: peep['user_id'])
    end
  end

  def self.create(text, user_id)
    result = DatabaseConnection.query("INSERT INTO peeps(text, time, user_id) VALUES('#{text}', '#{Time.now}', '#{user_id}') RETURNING id, text, time, user_id;")
    Peep.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'], user_id: result[0]['user_id'])
  end

  def self.select(user_id)
    self.all.find { |user_list| user_list.id == user.id }
  end
end
