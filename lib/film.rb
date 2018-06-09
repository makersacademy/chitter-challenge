class Film

  attr_reader :title, :rating

  def initialize(options)
    @title = options[:title]
    @rating = options[:rating]
  end

  def ==(other)
    @title == other.title
  end

  def self.all
    connection = connect_to_correct_database
    result = connection.exec("SELECT * FROM films")
    result.map{ |film| Film.new(title: film['title'], rating: film['rating']) }
  end

  def self.create(options)
    return false if invalid_film?(options)
    connection = connect_to_correct_database

    result = connection.exec("INSERT INTO films (title, rating)
      VALUES('#{options[:title]}', '#{options[:rating]}')
      RETURNING title, rating;")
    Film.new(title: result.first['title'],
      rating: result.first['rating'])
  end

  private

  def self.connect_to_correct_database
    if ENV['ENVIRONMENT'] = 'test'
      PG.connect(dbname: 'faldo_movie_ratings_test')
    else
      PG.connect(dbname: 'faldo_movie_ratings')
    end
  end

  def self.invalid_film?(options)
    return true if options[:rating].length == 0

  end
end
