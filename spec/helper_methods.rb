def clean_test_database
	  @conn = PG.connect(dbname: 'message_list_test')
	  @conn.exec("TRUNCATE messages;")
end
