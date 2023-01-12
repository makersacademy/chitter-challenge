require_relative './peep'
class PeepRepository

    def all
      sql = 'SELECT id, message, date, user_id FROM peeps;'
      result_set = DatabaseConnection.exec_params(sql,[])

      peeps = []

      result_set.each do |record|
        peep = Peep.new
        peep.id = record['id']
        peep.message = record['message']
        peep.date = record['date']
        peep.user_id = record['user_id']

        peeps << peep
      end 
      return peeps
    end
  
    def add(peep)
      
      sql = 'INSERT INTO peeps (message, date, user_id) VALUES ($1, $2, $3);'
      result_set = [peep.message, peep.date, peep.user_id]

      DatabaseConnection.exec_params(sql, result_set)
    end
  
  
end