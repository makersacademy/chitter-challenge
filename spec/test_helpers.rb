def truncate_table
  controller = PG.connect :dbname => 'chitter_test'
  controller.exec ("TRUNCATE TABLE peeps")
end