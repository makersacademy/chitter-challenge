require_relative './database_start_script'

class Peep

  attr_reader :published, :edited, :id, :content, :poster

  def initialize(id:,content:,published:,edited:)
    @id = id
    @content = content
    @published = DateTime.parse(published).strftime("%k:%M:%S %d-%m-%Y")
    @edited = DateTime.parse(edited).strftime("%k:%M:%S %d-%m-%Y")
    @poster = poster
  end

  def self.add(content)
    DatabaseConnection.query("INSERT INTO peeps (content) VALUES('#{content}') RETURNING *;")
        .map do |record| Peep.new(id: record['id'],
                                  content: record['content'],
                                  published: record['published'],
                                  edited: record['edited'])
        end
  end

  def self.all
    DatabaseConnection.query("SELECT * FROM peeps ORDER BY published DESC")
        .map do |record| Peep.new(id: record['id'],
                                  content: record['content'],
                                  published: record['published'],
                                  edited: record['edited'])
    end
  end

  def poster
    DatabaseConnection.query("SELECT users.name FROM user_peeps INNER JOIN users ON users.id = (SELECT user_peeps.user_id WHERE user_peeps.peep_id = '#{@id}');")
        .map { |record| record['name'] }.join.capitalize
  end

end