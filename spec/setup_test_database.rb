require 'pg'

con = PG.connect dbname: 'database_name', user: 'user'

con.exec 'TRUNCATE table_name'
