class Comment

  attr_reader :comment

  def initialize(title: title, comment: comment, id: id)
    @title = title
    @comment = comment
    @id = id
  end

  def ==(other)
    @comment == other.comment
  end

  def self.show(title: title)
    connection = connect_to_correct_database
    results = connection.exec("SELECT text FROM comments WHERE film_title = '#{title}'")
    results.map { |comment| Comment.new(title: "#{title}", comment: results.first['text']) }
  end

  def self.add(title: title, comment: comment)
    connection = connect_to_correct_database
    results = connection.exec("INSERT INTO comments (text, film_title)
      VALUES('#{comment}', '#{title}')
      RETURNING id, text, film_title;")
    # wrap the return into an object
    results.map { |comment| Comment.new(title: results.first['film_title'],
      comment: results.first['text'], id: results.first['id'])}
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
