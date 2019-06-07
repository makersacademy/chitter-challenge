require 'pg'

def truncates
    DatabaseConnection.query('TRUNCATE peeps RESTART IDENTITY')
end