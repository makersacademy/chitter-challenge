require'./lib/database_connection'
if ENV['ENVIROMENT'] == 'test'
   DatabaseConnection.setup('chitter_test')
   # connection = PG.connect(dbname: 'bookmark_manager_test')
else
   DatabaseConnection.setup('chitter')
   # connection = PG.connect(dbname: 'bookmark_manager')
end
