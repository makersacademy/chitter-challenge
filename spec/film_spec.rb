describe Film do

  it 'returns all films in an array' do
    connection = PG.connect(dbname: 'faldo_movie_ratings_test')

    film_1 = Film.create(title: 'Film 1 Title', rating: '10')
    film_2 = Film.create(title: 'Film 2 Title', rating: '10')
    film_3 = Film.create(title: 'Film 3 Title', rating: '10')

    films = [
      film_1,
      film_2,
      film_3
    ]

    expect(Film.all).to eq(films)
  end

  it 'creates a new film' do
    film = Film.create(title: 'Shawshank Redemption', rating: "10")
    expect(Film.all).to include film
  end

  xit 'user gets error if enter rating over 10' do

  end

  xit 'user gets error if they enter negative number' do

  end

  xit 'user gets error if they enter title over 60 chars' do

  end

  describe '#==' do
    it 'two bookmarks are equal if their ids match' do
      bookmark_1 = Film.new(title: "Pulp Fiction", rating: '9')
      bookmark_2 = Film.new(title: "Pulp Fiction", rating: '9')

      expect(bookmark_1).to eq(bookmark_2)
    end
  end

end
