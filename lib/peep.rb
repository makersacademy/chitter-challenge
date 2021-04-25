class Peep
  attr_reader :text, :time

  def initialize(args = {})
    @user_id = args[:user_id] || 'user'
    @text = args[:text]
    @time = args[:time]
  end

  class << self
    def create(args = {})
      DatabaseConnection.query("INSERT INTO peeps (text,user_id,time_stamp) VALUES('#{args[:text]}', '#{args[:user_id]}', '#{posted_time}')")
    end

    def list
      result = DatabaseConnection.query("SELECT * FROM peeps")
      result.map { |peep| Peep.new(text: peep['text'], time: peep['time_stamp']) }.reverse
    end

    private
    def posted_time
      Time.new.strftime("%k:%M on %d/%m/%Y")
    end
  end
end
