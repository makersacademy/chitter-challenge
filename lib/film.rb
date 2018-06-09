class Film

  def initialize(options)
    @title = options[:title]
    @rating = options[:rating]
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'faldo_movie_ratings_test')
    else
      connection = PG.connect(dbname: 'faldo_movie_ratings')
    end

    result = connection.exec("SELECT * FROM films")
    result.map{ |film| film }
    # result.map{ |film| Film.new(title: film['title'], rating: film['rating']) }
  end

  # def self.create(options)
  #   connection = PG.connect(dbanme: 'faldo_movie_ratings')
  #
  #   result =
  # end

end
