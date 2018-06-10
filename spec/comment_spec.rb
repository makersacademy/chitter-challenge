describe Comment do
  describe '.show' do
    it 'shows the comments for given film' do
      # Create films
      Film.create(title: 'Film 1 Title', rating: '10')
      Film.create(title: 'Film 2 Title', rating: '7')
      Film.create(title: 'Film 3 Title', rating: '8')
      comment = "This is a comment about the film that user can make"


      # Add comment to database for Film 2
      connection = PG.connect(dbname: 'faldo_movie_ratings_test')
      connection.exec("INSERT INTO comments (text, film_title) VALUES('#{comment}', 'Film 2 Title');")

      # Verify
      expect(Comment.show(title: "Film 2 Title")).to include(comment)
    end

  end

  # describe '.add' do
  #   it 'it can add comments' do
  #     # Setup
  #     add database with 'Film Title' in it
  #     comment = "This is a comment about the film that user can make"
  #     # Exercise
  #     Comment.add(title: "Film Title", comment: comment)
  #     comments_for_film = Comment.show("Film Title")
  #     # Verify
  #     expect(comments_for_film).to include(comment)
  #   end
  # end
end
