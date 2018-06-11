class Comment

  attr_reader :id, :comment, :title

  def initialize(options)
    @title = options[:title]
    @comment = options[:comment]
    @id = options[:id]
  end

  def ==(other)
    @id== other.id
  end

  def self.add(options)
    connection = connect_to_correct_database
    results = insert_into_database_and_return(connection, options)
    wrap_comment_object_around(results)
  end

  def self.all
    connection = connect_to_correct_database
    results = connection.exec("SELECT * FROM comments;")
    create_new_comment_from(results)
  end

  private

  def self.connect_to_correct_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'faldo_movie_ratings_test')
    else
      PG.connect(dbname: 'faldo_movie_ratings')
    end
  end

  def self.insert_into_database_and_return(connection, options)
    connection.exec("INSERT INTO comments (text, film_title)
      VALUES('#{options[:comment]}', '#{options[:title]}')
      RETURNING id, text, film_title;")
  end

  def self.wrap_comment_object_around(results)
    results.map { |comment| Comment.new(title: results.first['film_title'],
      comment: results.first['text'], id: results.first['id'])}
  end

  def self.create_new_comment_from(results)
    results.map do |comment|
      Comment.new(title: comment['film_title'],
        comment: comment['text'], id: comment['id'])
    end
  end
end

  # I built this before I created .all, I don't think I need it
  # but leaving here in case it proves useful in future
  # def self.show(title: title)
  #   connection = connect_to_correct_database
  #   results = connection.exec("SELECT text, id, film_title FROM comments WHERE film_title = '#{title}'")
  #   results.map { |comment| Comment.new(title: results.first['film_title'],
  #     comment: results.first['text'], id: results.first['id']) }
  # end
