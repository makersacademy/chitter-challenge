require_relative 'peep'

class PeepRepository

  def all
    result = DatabaseConnection.exec_params('SELECT * FROM peeps;', [])
    peeps = []
    result.each do |row| 
      peep = Peep.new
      peep.id = row['id'].to_i
      peep.title = row['title']
      peep.content = row['content']
      peep.date_posted = row['date_posted']
      peep.maker_id = row['maker_id'].to_i
      peeps << peep
    end
    peeps
  end

  def by_maker(maker_id)
    result = DatabaseConnection.exec_params('SELECT * FROM peeps WHERE maker_id = $1', [maker_id])
    maker_peeps = []
    result.each do |row|
      peep = Peep.new
      peep.id = row['id'].to_i
      peep.title = row['title']
      peep.content = row['content']
      peep.date_posted = row['date_posted']
      peep.maker_id = row['maker_id'].to_i
      maker_peeps << peep
    end
    maker_peeps
  end

  def create(peep_obj)
    sql = 'INSERT INTO peeps(title, content, date_posted, maker_id) VALUES($1, $2, $3, $4);'
    params = [peep_obj.title, peep_obj.content, peep_obj.date_posted, peep_obj.maker_id]
    result = DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = 'DELETE FROM peeps WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
  end
end
