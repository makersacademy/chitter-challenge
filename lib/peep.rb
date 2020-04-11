class Peep
  attr_reader :message, :peep_id, :time, :user

  def initialize(text:, time:, id:, peeper_id:)
    @message = text
    @peep_id = id
    @time = time
    @user = peeper_id
  end

  def self.all
    self.connect
    rs = @con.exec "SELECT * FROM peeps ORDER BY id DESC"
    rs.map { |row| Peep.new(text: row['text'], time: row['time'], id: row['id'], peeper_id: row['user_id'])}
  end

  def self.connect
    if ENV['RACK_ENV'] == 'test'
      @con = PG.connect :dbname => 'chitter_test', :user => 'edwardphillips'
    else 
      @con = PG.connect :dbname => 'chitter', :user => 'edwardphillips'
    end
  end

  def self.create(text:, user:)
    self.connect
    @con.exec("INSERT INTO peeps(text,user_id, time) VALUES('#{text}', '#{user}', '#{Time.now.utc}')")
  end

end