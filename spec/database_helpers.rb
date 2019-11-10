require 'pg'




def row_creation_verifier(table:,id:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("SELECT * FROM #{table} WHERE id = #{id}").first
end

def reset_table
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE user_accounts")
  connection.exec("TRUNCATE chits")
end

def add_message_to_database
  Message.new_message(sender:"Ailsa", content:"FML I love database soo much!!")
  Message.new_message(sender:"Ed", content:"Databases are the bomb")
  Message.new_message(sender:"Bea", content:"OMG D A T A B A S E S!")
end
