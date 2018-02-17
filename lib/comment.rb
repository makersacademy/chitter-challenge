require 'pg'

class Comment

  def self.all
    result = DatabaseConnection.query("SELECT * FROM comments")
    result.column_values(1)
  end

  def self.create(comment)
    DatabaseConnection.query("INSERT INTO comments(comment) VALUES('#{comment}')")
  end

end
