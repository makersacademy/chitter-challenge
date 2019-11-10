class Peep

  attr_reader :message, :user_handle, :user_name, :time_stamp

  def initialize(message, user_handle, user_name, timestamp)
    @message = message
    @user_handle = user_handle
    @user_name = user_name
    @time_stamp = timestamp
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end

    result = @connection.exec("SELECT * FROM peeps")
    result.map do |row|
      Peep.new(row['message'], row['user_handle'], row['user_name'], row['time_stamp'])
    end
  end

  def self.create(message, user_handle, user_name)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    time_stamp = Time.new.strftime("%I:%M:%p on %d/%m/%y")
    result = connection.exec("INSERT INTO peeps (message, user_handle, user_name, time_stamp) VALUES ('#{message}', '#{user_handle}', '#{user_name}', '#{time_stamp}') RETURNING message, user_handle, user_name, time_stamp;")
    Peep.new(result[0]['message'], result[0]['user_handle'], result[0]['user_name'], result[0]['time_stamp'])
  end

end
