require 'pg'

class Peep

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result = result.sort_by { |k| k["created_at"]}.reverse

  end


  def self.create(userid:, content:)
    result = DatabaseConnection.query("INSERT INTO peeps(userid, content) VALUES('#{userid}', '#{content}');")
    # Peep.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
  end

end