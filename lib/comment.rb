class Comment
  def self.show(title: title)
    # Connect to database
    connection = connect_to_correct_database
    # Execute query to retrieve the data
    results = connection.exec("SELECT text FROM comments WHERE film_title = '#{title}'")
    # Return an array of objects that have strings of text as state
    results.map { |comment| comment['text'] }
  end

  def self.add(title: title, comment: comment)
    # connect to database
    connection = connect_to_correct_database
    # sql query to add comment to table
    results = connection.exec("INSERT INTO comments (text, film_title) VALUES('#{comment}', '#{title}');")
    # wrap the return into an object
  end

  private

  def self.connect_to_correct_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'faldo_movie_ratings_test')
    else
      PG.connect(dbname: 'faldo_movie_ratings')
    end
  end
end
