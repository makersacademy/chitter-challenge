require 'pg'

class Peep

  # attr_reader :content, :posttime

  # def initialize(content:, posttime:)
  #   @content = content
  #   @posttime = posttime
  # end
  
  def self.create(content:)
    time = Time.now
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec_params("INSERT INTO peeps(
      content, posttime, author_id) 
      VALUES('#{content}', '#{time}', 1)");
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      "#{peep['content']} posted at: #{peep['posttime']}"
    end
  end    
end