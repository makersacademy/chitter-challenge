def setup_test_database!
  connection = PG.connect(dbname: 'faldo_movie_ratings_test')
  connection.exec("TRUNCATE films;")
end
