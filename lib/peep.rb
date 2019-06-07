require 'pg'

class Peep
  attr_reader :name, :content, :timestamp, :peeps_list

  def initialize(name, content)
    @name = name
    @content = content
    @peeps_list = []
  end

  def self.all
    connection = ENV["ENVIRONMENMT"] == "test" ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
    result = connection.exec("select * from peeps order by id desc")
    result.map { |peep| Peep.new(peep['name'], peep['content']) }
  end

  def to_s
    "#{@name}: #{@content}"
  end

  def create
    @peeps_list.push({ name: name, content: content })
  end
end
