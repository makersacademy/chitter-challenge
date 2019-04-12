class Peeps

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message, date_time) VALUES('#{message}', '#{Time.now.strftime("%d/%m/%Y %H:%M")}') RETURNING id, message, date_time;")
    Peeps.new(id: result[0]['id'], message: result[0]['message'], date_time: result[0]['date_time'])
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC")
    result.map do |peep|
      Peeps.new(
        id: peep['id'],
        message: peep['message'],
        date_time: peep['date_time']
      )
    end
  end

  attr_reader :id, :message, :date_time

  def initialize(id:, message:, date_time:)
    @id = id
    @message = message
    @date_time = date_time
  end
end
