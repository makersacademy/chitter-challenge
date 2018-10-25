class Peep

  attr_reader :content

  def initialize(content)
    @content = content
  end

  def self.create(content)
    find_db
    @conn.exec("INSERT INTO peeps(content) VALUES('#{content}') RETURNING content;")
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
