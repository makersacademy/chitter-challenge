require 'pg'

class Peep

  attr_reader :content, :time

  def initialize(content, time)
    @content = content
    @time = time
  end

  def self.create(content, time)
    find_db
    @conn.exec("INSERT INTO peeps(content,time) VALUES('#{content}','#{time}') RETURNING content;")
  end

  private
  def self.find_db
    if ENV['RACK_ENV'] == 'test'
      @conn = PG.connect(dbname: 'chitter_test')
    else
      @conn = PG.connect(dbname: 'chitter')
    end
  end
end
