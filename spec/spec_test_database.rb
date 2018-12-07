CONNECTION = PG.connect :dbname => 'chitter_manager_test'

def set_up_database
  clear_database
end

def clear_database
  CONNECTION.exec "TRUNCATE TABLE peep, users;"
end
