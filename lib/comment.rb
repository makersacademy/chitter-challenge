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
    results = connection.exec("INSERT INTO comments (text, film_title)
      VALUES('#{options[:comment]}', '#{options[:title]}')
      RETURNING id, text, film_title;")
    results.map { |comment| Comment.new(title: results.first['film_title'],
      comment: results.first['text'], id: results.first['id'])}
  end

  def self.all
    connection = connect_to_correct_database
    results = connection.exec("SELECT * FROM comments;")
    counter = -1
    results.map do |comment|
      counter += 1
      Comment.new(title: results[counter]['film_title'],
        comment: results[counter]['text'], id: results[counter]['id'])
    end
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

  # I built this before I created .all, I don't think I need it
  # but leaving here in case it proves useful in future
  # def self.show(title: title)
  #   connection = connect_to_correct_database
  #   results = connection.exec("SELECT text, id, film_title FROM comments WHERE film_title = '#{title}'")
  #   results.map { |comment| Comment.new(title: results.first['film_title'],
  #     comment: results.first['text'], id: results.first['id']) }
  # end
