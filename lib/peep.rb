
class Peep
  attr_reader :id, :time, :text, :user_id

  def initialize(id:, time:, text:, user_id:)
    @id = id
    @time = time
    @text = text
    @user_id = user_id
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
