describe Film do

  describe '.all' do
    it 'returns all films in an array' do
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

    context 'When fed a_to_z parameter' do
      it 'returns an array alphabatised by first letter in title' do
        film_c = Film.create(title: 'Cars', rating: '5')
        film_a = Film.create(title: 'A bugs Tale', rating: '8')
        film_b = Film.create(title: 'Back to the Future', rating: '9')

        alphabetical_list = [
          film_a,
          film_b,
          film_c
        ]

        result = Film.all("a_to_z")

        expect(result).to eq alphabetical_list
      end
    end

    it 'returns the date the film was added' do
      film_1 = Film.create(title: 'Film 1 Title', rating: '10')

      list_of_films = Film.all

      film_date = list_of_films.first.date_added

      expect(film_date).to eq("#{Time.now.strftime("%d/%m/%Y")}")
    end
  end

  describe '.create' do
    it 'creates a new film' do
      film = Film.create(title: 'Shawshank Redemption', rating: "10")
      expect(Film.all).to include film
    end

    it 'returns false if ratings is empty' do
      expect(Film.create(title: 'Just the title', rating: "")).to eq false
    end
    it 'returns false if title is empty' do
      result = Film.create(title: '', rating: '7')
      expect(result).to be false
    end
    it 'returns false if rating is over 10' do
      result = Film.create(title: 'Valid Title', rating: '11')
      expect(result).to be false
    end
    it 'returns false if rating is under 0' do
      result = Film.create(title: 'Valid Title', rating: '-10')
      expect(result).to be false
    end
    xit 'returns false if rating is not a number' do
      result = Film.create(title: 'Valid Title', rating: 'not a number')
      expect(result).to be false
    end
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
