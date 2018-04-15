module Database
  
  def setup_test
    @database = PG.connect :dbname => 'chit_test', :user => 'danielwork'
  end

  def setup_regular
    @database = PG.connect :dbname => 'chitter', :user => 'danielwork'
  end

  def create_table
    @table = @database.exec "SELECT * FROM posts"
    @table
  end

  def add_to_database(chit)
    @database.exec_params('INSERT INTO posts (content, time) VALUES ($1, $2)', [chit.post, chit.time])
  end

end

class Chitter

  extend Database

  attr_reader :database

  def self.connect
    ENV['RACK_ENV'] == 'test' ? setup_test : setup_regular
  end

  def self.add(chit)
    add_to_database(chit)
  end

  def self.show_chits
    create_table.map { |row | Chit.new(row['content'], row['time'])}.reverse
  end

end

class Chit

  attr_reader :post, :time
  
  def initialize(post, time = Time.now.asctime)
    @post = post
    @time = time
  end

end


