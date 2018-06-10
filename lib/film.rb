class Film

  attr_reader :title, :rating, :date_added

  def initialize(options)
    @title = options[:title]
    @rating = options[:rating]
    @date_added = options[:date_added]
  end

  def ==(other)
    @title == other.title
  end

  def self.all(sort_by = nil)
    connection = connect_to_correct_database

    if sort_by == "a_to_z"
      result = connection.exec("SELECT title, rating, date(date_added) FROM films ORDER BY UPPER(title) ASC;")
    else
      result = connection.exec("SELECT title, rating, date(date_added) FROM films;")
    end


    result.map{ |film| Film.new(title: film['title'], rating: film['rating'], date_added: film['date']) }
  end

  def self.create(options)
    return false if invalid_film?(options)
    connection = connect_to_correct_database

    result = connection.exec("INSERT INTO films (title, rating, date_added)
      VALUES('#{options[:title]}', '#{options[:rating]}', 'NOW()')
      RETURNING title, rating, date(date_added)")

    Film.new(title: result.first['title'],
      rating: result.first['rating'], date_added: result.first['date'])
  end

  private

  def self.connect_to_correct_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'faldo_movie_ratings_test')
    else
      PG.connect(dbname: 'faldo_movie_ratings')
    end
  end

  def self.invalid_film?(options)
    return true if options[:rating].length == 0
    return true if options[:title].length == 0
    return true if options[:rating].to_i > 10
    return true if options[:rating].to_i < 0
  end
end
