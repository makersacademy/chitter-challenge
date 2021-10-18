class Peep
  attr_reader :content, :id

  def initialize(id:, content:, created_at:)
    @id = id
    @content = content
    @created_at = created_at
  end

  def self.create(content:)
    result = DatabaseConnection.query(
"INSERT INTO peeps (content) VALUES ($1) RETURNING id, content;", [content])
    Peep.new(id: result[0]["id"], content: result[0]['content'], 
created_at: result[0]["created_at"])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at desc;")
    result.map do |peep|
      Peep.new(id: peep["id"], content: peep["content"], created_at: peep["created_at"])
    end    
  end

  def time
    result = DatabaseConnection.query("SELECT created_at::time FROM peeps where id = #{id};")
    result[0]["created_at"].slice(0...5)
  end
end
