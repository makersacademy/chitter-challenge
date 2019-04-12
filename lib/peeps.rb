class Peeps

  def self.create(message:, user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (message, date_time, user_id) VALUES('#{message}', '#{Time.now.strftime("%d/%m/%Y %H:%M")}', #{user_id}) RETURNING id, message, date_time, user_id;")
    Peeps.new(id: result[0]['id'], message: result[0]['message'], date_time: result[0]['date_time'], user_id: result[0]['user_id'])
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
        date_time: peep['date_time'],
        user_id: peep['user_id']
      )
    end
  end

  attr_reader :id, :message, :date_time, :user_id

  def initialize(id:, message:, date_time:, user_id:)
    @id = id
    @message = message
    @date_time = date_time
    @user_id = user_id
  end
  
  def username(user_class = User)
    @user = user_class.find(id: user_id)
    return @user.username
  end

  def name(user_class = User)
    @user = user_class.find(id: user_id)
    return @user.name
  end

end
