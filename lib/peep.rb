
class Peep
  attr_reader :id, :time, :text, :user_id

  def initialize(id:, time:, text:, user_id:)
    @id = id
    @time = time
    @text = text
    @user_id = user_id
  end

  def self.create(user_id:, text:)
    if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'chitter_test')
    else
     connection = PG.connect(dbname: 'chitter')
    end

    connection = connection.exec("INSERT INTO peeps (time, text, user_id) VALUES ('#{Time.now}', '#{text}', '#{user_id}') RETURNING id, time, text, user_id;")
    Peep.new(
    id: connection[0]['id'],
    time: connection[0]['time'],
    text: connection[0]['text'],
    user_id: connection[0]['user_id']
    )
  end
  def self.all
    # [
    #     "I just ate an apple",
    #     "Chitter is the best",
    #     "Howdy"
    #   ]
      if ENV['ENVIRONMENT'] == 'test'
       connection = PG.connect(dbname: 'chitter_test')
      else
       connection = PG.connect(dbname: 'chitter')
      end
      connection.exec("SELECT * FROM peeps").map do |peep|
        Peep.new(
        id: peep['id'],
        time: peep['time'],
        text: peep['text'],
        user_id: peep['user_id']
        )
      end
  end
end
