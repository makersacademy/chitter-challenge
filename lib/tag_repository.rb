require_relative 'tag'

class TagRepository

  def all

    tags = []

    sql = 'SELECT maker_id, peep_id FROM tags;'
    result_set = DatabaseConnection.exec_params(sql,[])

    result_set.each do |record|
      tag = Tag.new
      tag.maker_id = record['maker_id']
      tag.peep_id = record['peep_id']
      tags << tag
    end
    return tags
  end

  def create(tag)

    sql = 'INSERT INTO tags (maker_id,peep_id) VALUES($1,$2);'
    params = [tag.maker_id,tag.peep_id]
    DatabaseConnection.exec_params(sql,params)
    return tag
  end

  def delete(tag)
    sql = 'DELETE FROM tags WHERE maker_id = $1 AND peep_id = $2;'
    params = [tag.maker_id,tag.peep_id]
    DatabaseConnection.exec_params(sql,params)

  end


end