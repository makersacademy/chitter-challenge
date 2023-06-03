require_relative '../models/tag'
require 'database_connection'

class TagRepository
  def self.create(name)
    query = "INSERT INTO tags (name) VALUES ($1) RETURNING id;"
    DatabaseConnection.exec_params(query, [name])
    nil
  end

  def self.find(tag_id)
    query = "SELECT id, name FROM tags WHERE id = $1;"
    result = DatabaseConnection.exec_params(query, [tag_id])

    build_tag(result[0])
  end

  def self.all
    tags = []
    query = "SELECT id, name FROM tags;"
    result = DatabaseConnection.exec_params(query, [])
    result.each do |tag|
      tags << build_tag(tag)
    end
    tags
  end

  def self.update(name, id)
    query = "UPDATE tags SET name = $1 WHERE id = $2;"
    DatabaseConnection.exec_params(query, [name, id])
  end

  def self.delete(id)
    query = "DELETE FROM tags WHERE id = $1;"
    DatabaseConnection.exec_params(query, [id])
  end

  private

  def self.build_tag(inst)
    return nil if inst.nil?
    tag = Tag.new
    tag.id = inst['id'].to_i
    tag.name = inst['name']
    tag
  end
end
