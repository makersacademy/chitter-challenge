require 'pg'

class Peep
  attr_reader :name, :content, :time_stamp, :peeps_list

  def initialize(name, content, time_stamp = nil)
    @name = name
    @content = content
    @time_stamp = time_stamp
  end

  def self.all
    connection = ENV["ENVIRONMENMT"] == "test" ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
    result = connection.exec("select * from peeps order by id desc")
    result.map { |peep| Peep.new(peep['name'], peep['content'], peep['time_stamp']) }
  end

  def create
    connection = ENV["ENVIRONMENMT"] == "test" ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
    connection.exec("insert into peeps (name, content, time_stamp) values ('#{@name}', '#{@content}', NOW());")
  end

  def to_s
    "#{@name}: #{@content}"
  end
end
