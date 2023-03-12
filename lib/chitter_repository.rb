class ChitterRepository

    # Selecting all records
    # No arguments
    def all
      result_set = DatabaseConnection.exec_params('SELECT id,contents,time,user_id FROM chitters;',[])
      all_chitters = []
      result_set.each do |chitter|
        peep = Chitter.new
        peep.id = chitter['id']
        peep.contents = chitter['contents']
        peep.time = chitter['time']
        peep.user_id = chitter['user_id']
        all_chitters.push (peep)
      end
      return all_chitters
    end
  
    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
      # Executes the SQL query:
      # SELECT id, title, author_name FROM book WHERE id = $1;
        result_set = DatabaseConnection.exec_params('SELECT id, contents, time ,user_id FROM chitters WHERE id = $1;',[id])
        peep = Chitter.new
        peep.id = result_set[0]['id']
        peep.contents = result_set[0]['contents']
        peep.time = result_set[0]['time']
        peep.user_id = result_set[0]['user_id']
        return peep
    end
  
    # Add more methods below for each operation you'd like to implement.
  
    # def create(chitter)
    # end
  
    # def update(chitter)
    # end
  
    # def delete(chitter)
    # end
end