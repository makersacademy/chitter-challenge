describe Film do
  it 'User can see a list of films' do
    connection = PG.connect(dbname: 'faldo_movie_ratings_test')

    connection.exec("INSERT INTO films (title, rating) VALUES('Film Title', '7');")

    film = {
      "title" => "Film Title",
      "rating" => "7"
    }

    expect(Film.all).to include(film)
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
