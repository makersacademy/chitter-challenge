require 'pg'

class DBconnection

    def initialize(db_name, user_name)
        @db_name = db_name
        @user_name = user_name
        @connection = nil
    end

    def create_connection
        @connection = PG.connect(dbname: @db_name)
    end

    def select_statement(query)
        result = @connection.exec(query)
    end

    def close_con
        @connection.close
    end

end
