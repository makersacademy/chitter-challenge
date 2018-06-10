describe Comment do
  describe '.show' do
    it 'shows the comments for given film' do
      connection = PG.connect(dbname: 'faldo_movie_ratings_test')

      # Create films in database
      connection.exec("INSERT INTO films (title, rating) VALUES ('Film 1 Title', '10');")
      connection.exec("INSERT INTO films (title, rating) VALUES ('Film 2 Title', '7');")
      connection.exec("INSERT INTO films (title, rating) VALUES ('Film 3 Title', '8');")

      # Add comment to database for Film 2
      comment = "This is a comment about the film that user can make"
      connection.exec("INSERT INTO comments (text, film_title) VALUES('#{comment}', 'Film 2 Title');")

      # Verify
      expect(Comment.show(title: "Film 2 Title")).to include(comment)
    end

  end

  describe '.add' do
    it 'it can add comments' do
      # Setup
      connection = PG.connect(dbname: 'faldo_movie_ratings_test')
      connection.exec("INSERT INTO films (title, rating) VALUES ('Film 1 Title', '10');")
      connection.exec("INSERT INTO films (title, rating) VALUES ('Film 2 Title', '7');")
      connection.exec("INSERT INTO films (title, rating) VALUES ('Film 3 Title', '8');")

      comment = "This is a comment about the film that user can make"
      # Exercise
      Comment.add(title: "Film 2 Title", comment: comment)
      # Verify
      expect(Comment.show(title: "Film 2 Title")).to include(comment)
    end
  end
end
