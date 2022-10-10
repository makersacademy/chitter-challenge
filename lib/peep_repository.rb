require './lib/peep.rb'

class PeepRepository

    def all
        query = "SELECT id, message, time_stamp, user_id FROM peeps;"
        params = []
        result_set = DatabaseConnection.exec_params(query, params)
        peeps = []
        
        result_set.each {|record| 
            peep = Peep.new
            peep.id = record["id"]
            peep.message = record["message"]
            peep.time_stamp = record["time_stamp"]
            peep.user_id  = record["user_id"]
            
            peeps << peep
        }
        return peeps
     end
    
     def create(peep)
        sql = 'INSERT INTO peeps (message, time_stamp, user_id) VALUES ($1, $2, $3)';
        params = [peep.message, peep.time_stamp, peep.user_id]
        DatabaseConnection.exec_params(sql, params)
    
        return ''
     end


end