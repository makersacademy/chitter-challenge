describe Film do
  it 'User can see a list of films' do
    connection = PG.connect(dbname: 'faldo_movie_ratings_test')

    connection.exec("INSERT INTO films (title, rating) VALUES('Film Title', '7');")
    raw_result = connection.exec("SELECT * FROM films;")
    result = raw_result.map{ |film| film }
    
    expect(Film.all).to include(result)
  end



  xit 'User can add a film' do
    # Setup
    film = {title: "Movie Title",rating: "8"}
    # Exercise
    Film.create(film)
    # Verification
    expect(Film.all).to include film
  end

end
