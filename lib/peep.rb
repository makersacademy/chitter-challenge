require 'PG'
require_relative 'db_connection'

class Peep
  attr_reader :content, :id

  def initialize(id, content)
    @id = id
    @content = content
  end

  def self.new_peep(content)
    prepare_insert
    results = (DBConnection.connection.exec_prepared('insert_statement', [content])).first
    p "results after running insert", results
    Peep.new(results['id'].to_i, results['content'])
  end

  def self.all
    results = DBConnection.query('select * from peep')
    results.map { |row| Peep.new(row['id'].to_i, row['content'])}
  end

  # private

  def self.prepare_insert
    DBConnection.connection.prepare('insert_statement', 'insert into peep (content) values ($1) returning id, content')
  end

  def format(content)
    content.gsub("'", "''")
  end

end
