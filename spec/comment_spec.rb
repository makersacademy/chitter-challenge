describe Comment do
  describe '.show' do
    it 'shows the comments for given film' do
      connection = PG.connect(dbname: 'faldo_movie_ratings_test')

      # Create films in database
      connection.exec("INSERT INTO films (title, rating) VALUES ('Film 1 Title', '10');")
      connection.exec("INSERT INTO films (title, rating) VALUES ('Film 2 Title', '7');")
      connection.exec("INSERT INTO films (title, rating) VALUES ('Film 3 Title', '8');")

      # Add comment to database for Film 2
      comment_to_add = "This is a comment about the film that users can make"
      connection.exec("INSERT INTO comments (text, film_title) VALUES('#{comment_to_add}', 'Film 2 Title');")
      comment = Comment.new(title: "Film 2 Title", comment: "This is a comment about the film that users can make")

      # Verify
      expect(Comment.show(title: "Film 2 Title").first).to eq(comment)
    end

  end

  describe '.add' do
    it 'it can add comments' do
      # Setup
      connection = PG.connect(dbname: 'faldo_movie_ratings_test')
      connection.exec("INSERT INTO films (title, rating) VALUES ('Film 1 Title', '10');")
      connection.exec("INSERT INTO films (title, rating) VALUES ('Film 2 Title', '7');")
      connection.exec("INSERT INTO films (title, rating) VALUES ('Film 3 Title', '8');")

      comment_to_add = "This is a comment about the film that user can make"
      # Exercise
      comment = Comment.add(title: "Film 2 Title", comment: comment_to_add)
      # Verify
      p comment
      expect(Comment.show(title: "Film 2 Title")).to eq(comment)
    end
  end

  describe '#==' do
    it 'two comments are equal if their text match' do
      comment_1 = Comment.new(title: "Film 2 Title", comment: "This is a comment about the film that users can make")
      comment_2 = Comment.new(title: "Film 2 Title", comment: "This is a comment about the film that users can make")

      expect(comment_1).to eq(comment_2)
    end
  end
end

# ADD A 'VIEW COMMENTS METHOD ON FILM '
