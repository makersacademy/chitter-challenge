require_relative './peep'

class PeepRepository

    # Selecting all records
    # No arguments
    def all
        # Executes the SQL query:
        # SELECT id, message, time, account_id FROM peeps;
        sql = 'SELECT id, message, time, account_id FROM peeps;'
        params = []

        peeps = []

        result_set = DatabaseConnection.exec_params(sql, params)
        result_set.each do |record|
            peep = Peep.new
            peep.id = record['id'].to_i
            peep.message = record['message']
            peep.time = record['time']
            peep.account_id = record['account_id'].to_i

            peeps << peep
        end

        return peeps
        # Returns an array of Peep objects.
    end

    # Gets a single record by its ID
    # One argument: the id (number)
    def find(account_id)
        # Executes the SQL query:
        # SELECT id, message, time, account_id FROM peeps WHERE id = $1;
        sql = 'SELECT id, message, time, account_id FROM peeps WHERE account_id = $1;'
        params = [account_id]

        peeps = []

        result_set = DatabaseConnection.exec_params(sql, params)
    
        result_set.each do |record|
            peep = Peep.new
            peep.id = record['id'].to_i
            peep.message = record['message']
            peep.time = record['time']
            peep.account_id = record['account_id'].to_i

            peeps << peep
        end

        return peeps
        
        # Returns an array of Peep objects with specific account_id 
    end

    # Inserts new Peep record into database
    def create(peep)
        # Executes the SQL query
        # INSERT into peeps (message, time, account_id) VALUES ($1, $2, $3);
        sql = 'INSERT INTO peeps (message, time, account_id) VALUES ($1, $2, $3);'
        params = [peep.message, peep.time, peep.account_id]

        DatabaseConnection.exec_params(sql, params)

        return nil
        # Returns nothing
    end

    #  Removes a Peep record from database
    def delete(id)
        # Executes the SQL query
        # DELETE FROM peeps WHERE id = $1;
        sql = 'DELETE FROM peeps WHERE id = $1;'
        params = [id]

        DatabaseConnection.exec_params(sql, params)

        return nil
        # Returns nothing
    end

    # def update(id, new_message)
    #     # Executes the SQL query
    #     # UPDATE peeps message = $1 WHERE id = $2
    #     sql = 'UPDATE peeps message = $1 WHERE id = $2;'
    #     params = [new_message, id]

    #     DatabaseConnection.exec_params(sql, params)

    #     # Returns nothing
    # end
end