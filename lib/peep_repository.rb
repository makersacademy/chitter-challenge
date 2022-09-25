

class PeepRepository
    def all
      peeps = []
  
      # Send the SQL query and get the result set.
      sql = 'SELECT * FROM peeps;'
      result_set = DatabaseConnection.exec_params(sql, [])
      
      # The result set is an array of hashes.
      # Loop through it to create a model
      # object for each record hash.
      result_set.each do |record|
  
        # Create a new model object
        # with the record data.
        peep = Peep.new
        peep.id = record['id'].to_i
        peep.username = record['username']
        peep.name = record['name']
        peep.time = record['time']
        peep.content = record['content']
        peep.user_id = record['user_id'].to_i
  
        peeps << peep
      end
  
      return peeps
    end
    
    #Find a peep by its id
    def find(id)
        sql = "SELECT * FROM peeps WHERE id = $1"
        results = DatabaseConnection.exec_params(sql, [id])
        row = results.first
    
        peep = Peep.new
        peep.id = row['id'].to_i # convert to integer
        peep.username = row['username']
        peep.name = row['name']
        peep.content = row['content']
        peep.time = row['time']
        peep.user_id = row['user_id'].to_i # convert to integer
    
        return peep
      end

    def create(peep)
      sql = 'INSERT INTO peeps (username, name, content, time, user_id) VALUES ($1, $2, $3, $4, $5);'
      params = [
        peep.username,
        peep.name, 
        peep.content, 
        peep.time, 
        peep.user_id]
      result_set = DatabaseConnection.exec_params(sql, params)
  
      return peep
    end
  
end