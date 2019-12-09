require 'pg'

class Peep

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result = result.sort_by { |k| k["created_at"]}.reverse.map do |item|
      Peep.new(id: item['id'], userid: item['userid'], content: item['content'], created_at: item['created_at'] )
    end
  end


  def self.create(userid:, content:)
    result = DatabaseConnection.query("INSERT INTO peeps(userid, content) VALUES('#{userid}', '#{content}') RETURNING id, userid, content, created_at;")
    Peep.new(id: result[0]['id'], userid: result[0]['userid'], content: result[0]['content'], created_at: result[0]['created_at'])
  end

  attr_reader :id, :userid, :content, :created_at

  def initialize(id:, userid:, content:, created_at:)
    @id = id
    @userid = userid
    @content = content
    @created_at = created_at
  end

end