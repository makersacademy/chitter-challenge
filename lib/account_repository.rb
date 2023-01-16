require_relative './account'

class AccountRepository

    # Selecting all records
    # No arguments
    def all
        # Executes the SQL query:
        # SELECT id, email, username, password, name FROM accounts;
        sql = 'SELECT id, email, username, password, name FROM accounts;'
        params = []

        accounts = []

        result_set = DatabaseConnection.exec_params(sql, params)
        result_set.each do |record|
            account = Account.new
            account.id = record['id'].to_i
            account.email = record['email']
            account.username = record['username']
            account.password = record['password']
            account.name = record['name']

            accounts << account
        end

        return accounts
        # Returns an array of Account objects.
    end

    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
        # Executes the SQL query:
        # SELECT id, email, username, password, name FROM accounts WHERE id = $1;
        sql = 'SELECT id, email, username, password, name FROM accounts WHERE id = $1;'
        params = [id]


        result_set = DatabaseConnection.exec_params(sql, params)
        record = result_set.first

        account = Account.new
        account.id = record['id'].to_i
        account.email = record['email']
        account.username = record['username']
        account.password = record['password']
        account.name = record['name']

        return account
        


        # Returns a single Account object.
    end

    # Inserts new Item record into database
    def create(account)
        # Executes the SQL query
        # INSERT into accounts (email, username, password, name) VALUES ($1, $2, $3, $4);
        sql = 'INSERT into accounts (email, username, password, name) VALUES ($1, $2, $3, $4);'
        params = [account.email, account.username, account.password, account.name]

        DatabaseConnection.exec_params(sql, params)

        # Returns nothing
    end
end