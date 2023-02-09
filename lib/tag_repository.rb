require_relative 'tag'

class TagRepository

  def all

    tags = []

    sql = 'SELECT maker_id, peep_id FROM tags;'
    result_set = DatabaseConnection.exec_params(sql,[])

    result_set.each do |record|
      tag = Tag.new
      tag.maker_id = record['maker_id'].to_i
      tag.peep_id = record['peep_id'].to_i
      tags << tag
    end
    return tags
  end

  def create(tag)

    sql = 'INSERT INTO tags (maker_id,peep_id) VALUES($1,$2);'
    params = [tag.maker_id,tag.peep_id]
    DatabaseConnection.exec_params(sql,params)
    return nil
  end

  # due to composite PK this cant work on id like I usually have
  def delete(tag)
    sql = 'DELETE FROM tags WHERE maker_id = $1 AND peep_id = $2;'
    params = [tag.maker_id,tag.peep_id]
    DatabaseConnection.exec_params(sql,params)
    return nil
  end


end