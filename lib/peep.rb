require 'pg'

class Peep
  attr_reader :name, :content, :time_stamp, :peeps_list

  def initialize(name, content, time_stamp = nil)
    @name = name
    @content = content
    @time_stamp = convert_date(time_stamp)
  end

  def self.all
    connection = ENV["ENVIRONMENMT"] == "test" ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
    result = connection.exec("select * from peeps order by time_stamp desc")
    result.map { |peep| Peep.new(peep['name'], peep['content'], peep['time_stamp']) }
  end

  def create
    connection = ENV["ENVIRONMENMT"] == "test" ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
    connection.exec("insert into peeps (name, content, time_stamp) values ('#{@name}', '#{@content}', NOW());")
  end

  def to_s
    "#{@name}: #{@content}"
  end

  private
  def convert_date(timestamp)
    DateTime.parse(timestamp).strftime('%d-%m-%Y at %I:%M %p') unless timestamp == nil
  end
end
