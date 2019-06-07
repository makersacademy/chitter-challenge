require "./lib/db_connection"

  connection = if ENV["RACK_ENV"] == "test"
                  DbConnection.setup("chitter_chatter_test")
                else
                  DbConnection.setup("chitter_chatter")
                end
